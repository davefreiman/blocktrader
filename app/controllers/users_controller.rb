class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user.new(user_params)

		if @user.save
			auto_login(@user)	
			redirect_to users_path
		else
			render :new
		end
	end

	def index
		@users = User.all
	end

	def user_params
		params.require(:user).permit(:username, :email, :first_name, :last_name, :password)
	end
end
