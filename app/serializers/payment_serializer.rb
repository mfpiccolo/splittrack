class PaymentSerializer < ActiveModel::Serializer
  attributes :name, :amount_cents, :payment_at, :user_id
end
