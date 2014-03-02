class User < ActiveRecord::Base

  has_many :split_payments
  has_many :receivables, foreign_key: "collector_id", class_name: "Entry"
  has_many :payables, foreign_key: "payer_id", class_name: "Entry"

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(usr)
    Thread.current[:current_user] = usr
  end

  def total_payable
    Money.new(payables.sum(&:amount))
  end

  def total_receivable
    Money.new(receivables.sum(&:amount))
  end

  def available_balance
    # TODO get from dwolla
    Money.new(0)
  end

  def balance_snapshot
    total_receivable + available_balance - total_payable
  end
end
