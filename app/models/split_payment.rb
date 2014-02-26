class SplitPayment < ActiveRecord::Base

  monetize :total_cents
  monetize :paid_cents
  monetize :cash_cents

end
