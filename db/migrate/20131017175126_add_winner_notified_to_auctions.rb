class AddWinnerNotifiedToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :winner_notified, :boolean
  end
end
