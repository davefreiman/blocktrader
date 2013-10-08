class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :postal_code
      t.float :lattitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end
  end
end
