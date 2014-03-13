class Entry < ActiveRecord::Base
  belongs_to :user

  monetize :amount_cents

  def self.approved
    where(approved: true)
  end

  def self.unapproved
    where(approved: false)
  end

  # TODO add validation to have either user id or email
end
