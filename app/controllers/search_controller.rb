class SearchController < ApplicationController
  def index
    @stores = Store.filter_by_zip(params[:q])
  end
end
