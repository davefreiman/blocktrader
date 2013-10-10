module AuctionsHelper
  
  def auction_summary(auction)
    if auction.leader == "" 
      "No Bids Yet "
    elsif auction.leader == auction.winner 
      "#{auction.winner.username} Won this Auction! "
    else   
      "Current Bid: $#{auction.current_price} By #{auction.leader} "
    end   
  end
end