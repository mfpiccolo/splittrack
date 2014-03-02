class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer  :collector_id
      t.integer  :payer_id
      t.integer  :source_id
      t.string   :source_type
      t.integer  :amount_cents
      t.string   :description

      t.timestamps
    end
  end
end
