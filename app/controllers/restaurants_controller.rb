class RestaurantsController < ApplicationController
  def index
    @categories = RestaurantCategory.all
  end

  def show
    @cart = Cart.find(session[:cart_id]) if session[:cart_id]
    @dishes = Dish.all
  end
end
