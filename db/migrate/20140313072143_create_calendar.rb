class CreateCalendar < ActiveRecord::Migration
  def up
    create_table :calendars do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :color

      t.timestamps
    end

    add_column :payments, :calendar_id, :integer
  end

  def down
    drop_table :calendars
    remove_column :payments, :calendar_id
  end
end
