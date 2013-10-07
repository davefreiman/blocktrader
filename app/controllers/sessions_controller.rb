class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		respond_to do |format|
			if @user = login(params[:email], params[:password])
				format.html { redirect_back_or_to(:root, :notice => "Login Successful")}
			else
				format.html { flash.noew[:alert] = "Login Failed, Invalid"; render :action => "new"}
			end
		end
	end

	def destroy
		logout
		redirect_to(:root, :notice => 'Bye')
	end

	def show
		
	end
end
