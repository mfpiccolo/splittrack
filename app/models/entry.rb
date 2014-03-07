class Entry < ActiveRecord::Base
  belongs_to :user

  monetize :amount_cents

  # TODO add validation to have either user id or email
end
