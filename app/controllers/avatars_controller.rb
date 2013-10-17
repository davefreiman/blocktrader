class AvatarsController < ApplicationController
	before_filter :require_login
	before_filter :require_user

	def index
		@avatars = @user.avatars.order(:id)
		@avatar = @user.avatars.build
	end

	def new
		@avatar = @user.avatars.build
	end

	def create
		@avatar = @user.avatars.build(avatar_params)
		if @avatar.save
			redirect_to [@user, :avatars], notice: "avatar uploaded. Check it out below."
		else
			@avatars = @user.avatars.order(:id)
			render :index
		end
	end

	def destroy
		@avatar = Avatar.find(params[:id])
		@avatar.destroy
		redirect_to user_avatars_path(@user), notice: "Avatar deleted"
	end

	def avatar_params
		params.require(:avatar).permit(:user_id, :file)
	end 

	protected

	def require_user
		@user = User.find(params[:user_id])
	end

end
