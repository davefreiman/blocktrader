class RatingsController < ApplicationController
  before_filter :load_user

  def index
    @user
    @ratings = @user.ratings.all
  end

  def new
    @rating = @user.ratings.new
    @scores = [1,2,3,4,5]
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = @user.id
    if @rating.save
      redirect_to current_user, :notice => "rating created. Thanks!"
    else  
      render :new
    end  
  end

  def rating_params
    params.require(:rating).permit(:score, :comment, :user_id)
  end

  private
  def load_user
    @user = User.find(params[:user_id])
  end
end