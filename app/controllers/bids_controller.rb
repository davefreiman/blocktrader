class BidsController < ApplicationController
	before_filter :load_auction

	def index
		@bids = @auction.bids.all
	end

	def new
		@bid = Bid.new
	end

	def create
		@bid = Bid.new(bid_params)
		@bid.user_id = current_user.id

		if @bid.save
			redirect_to auction_path(@auction), :notice => "bid processed"
		else
			render :new
		end		
	end

	def bid_params
		params.require(:bid).permit(:amount, :auction_id, :user_id)
	end

	private
	def load_auction
		@auction = Auction.find(params[:auction_id])
	end
end