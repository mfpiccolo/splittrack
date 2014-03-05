class AddEmailToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :payer_email, :string
  end
end
