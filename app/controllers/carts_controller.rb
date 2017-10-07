class CartsController < ApplicationController
  def add
    dish = Dish.find(params[:id])
    if Cart.any?
      find_cart
    else
      @cart = Cart.create
    end
    session[:cart_id] = @cart.id
    @cart.add(dish, dish.price)
    flash[:notice] = "#{dish.name} added to cart"
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def find_cart
    @cart = Cart.find(session[:cart_id]) if session[:cart_id]
  end
end
