class AuctionsController < ApplicationController

	def index
		@auctions = Auction.all
	end

	def show
		@auction = Auction.find(params[:id])
		@bid = @auction.bids.build
	end

	def new
		@auction = Auction.new
	end

	def create
		@auction = Auction.new(auction_params)
		@auction.user_id = current_user.id

		if @auction.save
			redirect_to auctions_path, :notice => "Auction Created"
		else
			flash.now[:alert] = "Auction creation failed. Try Again"
		end
	end

	def auction_params
		params.require(:auction).permit(:name, :duration, :start_price, :description, :user_id, :location_id)
	end

end