module AuctionsHelper
  
  def auction_summary(auction)
    if auction.leader == ""
      "No Bids Yet "
    elsif auction.leader != auction.winner 
      "Current Bid: $#{auction.current_price} By #{auction.leader.username}"  
    else   
      "#{auction.winner.username} Won this Auction For $#{auction.current_price}!"
    end   
  end
end