class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			auto_login(@user)	
			redirect_to users_path, notice: "Signed Up!"
		else
			render :new
			flash.now[:alert] = "Signup failed. Try Again" 
		end
	end


	def user_params
		params.require(:user).permit(:username, :email, :first_name, :last_name, :password)
	end
end
