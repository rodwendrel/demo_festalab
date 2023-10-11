class SearchController < ApplicationController
  def index
   @query = User.ransack(params[:q])
  end
end
