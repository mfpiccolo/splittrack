class SplitPayment < ActiveRecord::Base
  belongs_to :user

  monetize :total_cents, allow_nil: true
  monetize :paid_cents, allow_nil: true
  monetize :cash_cents, allow_nil: true

end
