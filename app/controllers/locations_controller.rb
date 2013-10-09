class LocationsController < ApplicationController
  before_filter :load_user
  before_filter :require_login

  def index
    @locations = @user.locations.all
  end

  def new
    @location = @user.locations.build
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = @user.locations.build(location_params)

    if @location.save 
      redirect_to user_path(@user), :notice => "Location Added"
    else
      render :new, flash.now[:alert] = "You messed up"  
    end  
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to user_locations_path(@user), notice: "Location deleted"
  end

  def location_params
    params.require(:location).permit(:address, :postal_code, :latitude, :longitude, :user_id)
  end

  private
  def load_user
    @user = current_user
  end
end