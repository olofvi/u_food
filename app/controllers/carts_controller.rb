class CartsController < ApplicationController
  def add
    dish = Dish.find(params[:id])
    if @cart == nil
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart.add(dish, dish.price)
      flash[:notice] = "#{dish.name} added to cart"
      redirect_to restaurant_path(params[:restaurant_id])
    else
      @cart = Cart.last
      session[:cart_id] = @cart.id
      @cart.add(dish, dish.price)
      flash[:notice] = "#{dish.name} added to cart"
      redirect_to restaurant_path(params[:restaurant_id])
    end
  end
end

