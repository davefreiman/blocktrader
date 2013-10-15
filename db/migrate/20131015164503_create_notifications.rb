class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notice
      t.integer :user_id
      t.integer :auction_id

      t.timestamps
    end
  end
end
