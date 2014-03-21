class ChangeBalanceCentsDefalutForUsers < ActiveRecord::Migration
  def change
    change_column :users, :balance_cents, :integer, default: 0
  end
end
