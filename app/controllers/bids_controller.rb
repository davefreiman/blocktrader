class BidsController < ApplicationController
	before_filter :load_auction
	before_filter :require_login, :only => [:create]

	def index
		@bids = @auction.bids.all
	end

	def new
		@bid = @auction.bids.build
	end

	def create
		@bid = @auction.bids.build(bid_params)
		@bid.user_id = current_user.id

		if @bid.save
			redirect_to auction_path(@auction), :notice => "bid processed"
		else
			redirect_to auction_path(@auction),
			:notice => "Bid More"  
		end		
	end

	def bid_params
		params.require(:bid).permit(:amount, :auction_id, :user_id)
	end

	private
	def load_auction
		@auction = Auction.find(params[:auction_id])
	end


	def require_login
		unless current_user
		  redirect_to new_session_path
		end
	end
end