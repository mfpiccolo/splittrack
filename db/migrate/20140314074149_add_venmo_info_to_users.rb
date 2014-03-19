class AddVenmoInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about,               :text
    add_column :users, :display_name,        :string
    add_column :users, :first_name,          :string
    add_column :users, :last_name,           :string
    add_column :users, :profile_picture_url, :string
    add_column :users, :username,            :string
    add_column :users, :balance_cents,       :integer
  end
end
