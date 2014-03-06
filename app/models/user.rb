class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:dwolla]

  has_many :split_payments
  has_many :receivables, foreign_key: "collector_id", class_name: "Entry"
  has_many :payables, foreign_key: "payer_id", class_name: "Entry"

  has_many :contact_relations
  has_many :contacts, through: :contact_relations, class_name: "User"

  # TODO remove?
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.dwolla_data"] && session["devise.dwolla_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
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

  def owe(contact_id)
    payables.where(collector_id: contact_id).sum(&:amount)
  end

  def owed(contact_id)
    receivables.where(payer_id: contact_id).sum(&:amount)
  end

  def owe_entries(contact_id)
    payables.where(collector_id: contact_id)
  end

  def owed_entries(contact_id)
    receivables.where(payer_id: contact_id)
  end
end
