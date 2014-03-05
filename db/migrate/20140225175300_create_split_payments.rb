class CreateSplitPayments < ActiveRecord::Migration
  def change
    create_table :split_payments do |t|
      t.integer :user_id
      t.string  :name
      t.integer :total_cents
      t.integer :paid_cents
      t.integer :cash_cents

      t.timestamps
    end
  end
end
