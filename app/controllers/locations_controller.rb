class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @q = Location.ransack(params[:q])
    @locations = @q.result(distinct: true)
  end
  
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    @location.save
    redirect_to locations_posts_path
  end
  
  def posts
    @locations = current_user.locations.all
  end
  
  def show
    @location = Location.find(params[:id])
  end
  
  def destroy
    @location = Location.find(params[:id])
    if @location.user != current_user
      redirect_to locations_posts_path
    else
      @location.destroy
      redirect_to locations_posts_path
    end
  end
  
  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(params.require(:location).permit(:location_name,:introduction,:address,:price,:location_image))
      redirect_to locations_posts_path
    else
      render "edit"
    end
  end
  
  private
    def location_params
      params.require(:location).permit(:location_name,:introduction,:address,:price,:location_image)
    end
end
