class CartsController < ApplicationController
  def add
    dish = Dish.find(params[:id])
    if Cart.any?
      @cart = Cart.last
    else
      @cart = Cart.create
    end
    session[:cart_id] = @cart.id
    @cart.add(dish, dish.price)
    flash[:notice] = "#{dish.name} added to cart"
    redirect_to restaurant_path(params[:restaurant_id])
  end
end
