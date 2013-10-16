class NotificationsController < ApplicationController


  before_filter :load_auctions
  def new
    @auctions.each do |auction|
      if auction.completed?
        @notification = Notification.new(:notice => "You have won #{auction.name}! Click here to check it out!", :auction_id => auction.id, :user_id => auction.winner.id)
        
      end  
    end  
  end

  def create
    
  end

  def index
    
  end2

  def load_auctions
    @auctions = Auction.all
  end
end