class AuctionsController < ApplicationController

	def index
		if params[:search]
			@auctions = Auction.search(params[:search]).order("created_at DESC")
		else
			@auctions = Auction.order("created_at DESC")
		end
	
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
		params.require(:auction).permit(:name, :duration, :start_price, :description, :user_id)
	end

end