class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(location_id: params[:location_id])
    redirect_back(fallback_location: root_path)
  end
    
  def destroy
    @location = Location.find(params[:location_id])
    @favorite = current_user.favorites.find_by(location_id: @location.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
