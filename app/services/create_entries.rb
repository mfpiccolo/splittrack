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
      Entry.create(
        collector_id: user.to_param,
        payer_id: e["id"],
        amount: e["amount"],
        source_id: source.to_param,
        source_type: source.class.name,
        description: source.name
      )
    end
  end

end
