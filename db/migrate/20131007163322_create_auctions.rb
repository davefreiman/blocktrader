class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :name
      t.integer :duration
      t.integer :start_price
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
