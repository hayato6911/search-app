class HomeController < ApplicationController
  def index
    @q = Location.ransack(params[:q])
    @locations = @q.result(distinct: true)
  end
end
