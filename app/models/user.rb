class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:venmo]

  has_many :split_payments
  has_many :receivables, foreign_key: "collector_id", class_name: "Entry"
  has_many :payables, foreign_key: "payer_id", class_name: "Entry"

  has_many :contact_relations
  has_many :contacts, through: :contact_relations, class_name: "User"

  monetize :balance_cents

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

  def total_payable(scope)
    scope.present? ? Money.new(payables.send(scope).sum(&:amount)) : Money.new(payables.sum(&:amount))
  end

  def total_receivable(scope)
    scope.present? ? Money.new(receivables.send(scope).sum(&:amount)) : Money.new(receivables.sum(&:amount))
  end

  def balance_snapshot
    total_receivable + available_balance - total_payable
  end

  def payable_entries_total(contact_id, scope = nil)
    payable_entries(contact_id, scope).sum(&:amount)
  end

  def receivable_entries_total(contact_id, scope = nil)
    receivable_entries(contact_id, scope).sum(&:amount)
  end

  def payable_entries(contact_id, scope = nil)
    entries = payables.where(collector_id: contact_id)
    scope.present? ? entries.send(scope) : entries
  end

  def receivable_entries(contact_id, scope = nil)
    entries = receivables.where(payer_id: contact_id)
    scope.present? ? entries.send(scope) : entries
  end
end
