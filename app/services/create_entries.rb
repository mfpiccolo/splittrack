class CreateEntries

  attr_reader :contact_payments, :user, :source

  def self.call(user, contact_payments, source)
    new(user, contact_payments, source).call
  end

  def initialize(user, contact_payments, source)
    @user = user
    @contact_payments = contact_payments
    @source = source
  end

  def call
    contact_payments.each do |e|
      entry = Entry.create!(
        collector_id: user.to_param,
        payer_id: e["id"],
        payer_email: e["email"],
        amount: e["amount"],
        source_id: source.to_param,
        source_type: source.class.name,
        description: source.name
      )

      email = entry.try(:user).try(:email) || entry.payer_email
      UserMailer.request_payment(user.to_param, entry.to_param, email).deliver
    end
  end

end
