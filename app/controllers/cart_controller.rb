class CartController < ApplicationController

  def create
    dish = Dish.find(params[:dish_id])
    @cart.add(dish, dish.price)
    flash[:notice] = "#{dish.title} added to order"
  end
end
