class StartOverWithPayments < ActiveRecord::Migration
  def change
    # drop_table :payments

    create_table :payments do |t|
      t.integer  :user_id
      t.string   :name
      t.integer  :amount_cents
      t.datetime :payment_at

      t.timestamps
    end
  end
end
