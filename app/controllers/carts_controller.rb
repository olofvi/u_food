class CartsController < ApplicationController
  def add_to_cart
    dish = Dish.find(params[:id])
    if Cart.any?
      @cart = Cart.last
      session[:cart_id] = @cart.id
      @cart.add(dish, dish.price)
      flash[:notice] = "#{dish.name} added to cart"
      redirect_to restaurant_path(params[:restaurant_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart.add(dish, dish.price)
      flash[:notice] = "#{dish.name} added to cart"
      redirect_to restaurant_path(params[:restaurant_id])
    end
  end
end

