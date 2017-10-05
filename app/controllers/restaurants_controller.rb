class RestaurantsController < ApplicationController
  def index
  end

  def show
    @dishes = Dish.all
  end
end