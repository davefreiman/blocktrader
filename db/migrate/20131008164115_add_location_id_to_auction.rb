class AddLocationIdToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :location_id, :integer
  end
end
