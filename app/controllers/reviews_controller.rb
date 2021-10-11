class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @location = Location.find(params[:location_id])
    @reviews = @location.reviews
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to location_reviews_path(@review.location)
    else
      @location = Location.find(params[:location_id])
      render "locations/show"
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:location_id, :score, :content)
  end
end
