class RestaurantsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @dishes = Dish.all
  end
end