namespace :notification do
  desc "sends notifications to users"
  task :notify => :environment do
    @auctions = Auction.all
    @auctions.each do |auction|
      if auction.winner && !auction.winner_notified
        p "working"
        notification = Notification.new(:user_id => auction.winner.id, :auction_id => auction.id, :notice => "You won the auction for #{auction.name}!")
        notification.save!
        UserMailer.won_auction(auction).deliver
        auction.update_attributes("winner_notified" => "true") 
        auction.save!
      end  
    end
  end
end