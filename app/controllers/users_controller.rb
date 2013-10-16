class UsersController < ApplicationController
  before_filter :require_login, :except => [:new, :create]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
    @locations = @user.locations.all
    @notifications = @user.notifications.all
    @auctions = Auction.all
    @ratings = @user.ratings.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			auto_login(@user)	
			redirect_to root_path, notice: "Signed Up!"
		else
			render :new
			flash.now[:alert] = "Signup failed. Try Again" 
		end
	end

	def edit
		@user = User.find(params[:id])
	end

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "Account updated!"
    else
      render :edit, flash.now[:alert] = "Not updated, try again"
    end
  end

	def user_params
		params.require(:user).permit(:username, :email, :first_name, :last_name, :password)
	end
end
