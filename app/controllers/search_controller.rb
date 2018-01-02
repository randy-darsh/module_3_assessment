class SearchController < ApplicationController
  def index
    @stations = BestbuyService.new({location: params[:q]}).stores
  end
end
