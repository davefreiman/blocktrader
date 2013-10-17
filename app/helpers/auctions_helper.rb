module AuctionsHelper
  
  def auction_summary(auction)
    if auction.leader == "" 
      "No Bids Yet "
    elsif auction.leader.username == auction.winner.username 
      "#{auction.winner.username} Won this Auction For $#{auction.current_price}!"
    else   
      "Current Bid: $#{auction.current_price} By #{auction.leader.username} "
    end   
  end
end