class RestaurantsController < ApplicationController
  def index
  end

  def show
    @cart = Cart.find(session[:cart_id]) if session[:cart_id]
    @dishes = Dish.all
  end
end
