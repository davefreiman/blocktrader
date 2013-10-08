class LocationsController < ApplicationController
  before_filter :load_user
  before_filter :require_login

  def index
    @locations = @user.locations.all
  end

  def new
    @location = @user.locations.build
  end

  def create
    @location = @user.locations.build(location_params)

    if @location.save 
      redirect_to user_path(@user), :notice => "Location Added"
    else
      render :new, flash.now[:alert] = "You messed up"  
    end  
  end

  def location_params
    params.require(:location).permit(:address, :postal_code, :lattitude, :longitude, :user_id)
  end

  private
  def load_user
    @user = current_user
  end
end