class RestaurantsController < ApplicationController
  def index
    @categories = Category.all
  end
end
