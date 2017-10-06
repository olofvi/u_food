class CartsController < ApplicationController
  def add
    dish = Dish.find(params[:id])
    @cart = Cart.create
    @cart.add(dish, dish.price)
    flash[:notice] = "#{dish.name} added to order"
    redirect_to restaurant_path(:id)
  end
end
