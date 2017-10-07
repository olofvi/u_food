class RestaurantsController < ApplicationController
  before_action :find_cart

  def index
    @categories = RestaurantCategory.all
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = Dish.all
  end
  
  def find_cart
    @cart = Cart.find(session[:cart_id]) if session[:cart_id]
  end
end
