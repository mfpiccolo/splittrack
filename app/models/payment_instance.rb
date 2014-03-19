class PaymentInstance
  include Rails.application.routes.url_helpers
  extend Rails.application.routes.url_helpers
  include ActiveModel::AttributeMethods
  delegate :url_helpers, to: 'Rails.application.routes'
  attr_accessor :title, :start, :end, :allDay, :payment_id, :color, :url, :background_color, :textColor

  def self.occurrences_between(begin_date,end_date, calendar_ids = '')
    # Using Squeel
    # line 1 = Payment doesn't repeat, but ends in window
    # line 2 = Payment doesn't repeat, but starts in window
    # line 2 = Payment doesn't repeat, but starts before and ends after
    # line 4 = Payment starts before our end date and repeats until a certain point of time, and that point of time after our begin date
    # line 5 = Payment repeats indefinitely, then all we care about is that it has started at somepoint in the last
    if !calendar_ids.empty?
      results = Payment.where{
        (
          (repeats == 'never') &
          (from_date >= begin_date) &
          (from_date <= end_date)
        ) | (
          (repeats == 'never') &
          (to_date >= begin_date) &
          (to_date <= end_date)
        ) | (
          (repeats == 'never') &
          (from_date <= begin_date) &
          (to_date >= end_date)
        ) | (
          (repeats != 'never') &
          (from_date <= end_date) &
          (repeat_ends == 'on') &
          (repeat_ends_on >= begin_date)
        ) | (
          (repeats != 'never') &
          (repeat_ends == 'never') &
          (from_date <= end_date)
        )
      }.where(:calendar_id => calendar_ids.split(',').reject{ |c| c.empty? }.uniq)
    else
     results = Payment.where{
       (
         (repeats == 'never') &
         (from_date >= begin_date) &
         (from_date <= end_date)
       ) | (
         (repeats == 'never') &
         (to_date >= begin_date) &
         (to_date <= end_date)
       ) | (
         (repeats == 'never') &
         (from_date <= begin_date) &
         (to_date >= end_date)
       ) | (
         (repeats != 'never') &
         (from_date <= end_date) &
         (repeat_ends == 'on') &
         (repeat_ends_on >= begin_date)
       ) | (
         (repeats != 'never') &
         (repeat_ends == 'never') &
         (from_date <= end_date)
       )
     }
    end
    results.map { |payment|
      payment.schedule.occurrences_between(begin_date,end_date).map { |date|
        i = PaymentInstance.new()
        i.title = payment.name
        i.color = payment.calendar.color
        i.url = Rails.application.routes.url_helpers.payment_path(payment)
        i.start = date
        i.end = date + payment.duration
        i.allDay = payment.is_all_day
        i.payment_id = payment.id
        i.textColor = 'black'
        i
      }
    }.flatten.sort! {|x,y| x.start <=> y.start }
  end

end
