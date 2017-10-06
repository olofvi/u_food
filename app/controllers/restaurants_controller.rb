class RestaurantsController < ApplicationController
  def index
    @categories = RestaurantCategory.all
  end

  def show
    @dishes = Dish.all
  end
end