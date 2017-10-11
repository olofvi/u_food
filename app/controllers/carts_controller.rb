class CartsController < ApplicationController

  def add
    dish = Dish.find(params[:id])
    if session[:cart_id]
      show
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart.add(dish, dish.price)
    flash[:notice] = "#{dish.name} added to cart"
    redirect_back(fallback_location: (request.referer || restaurant_path(params[:restaurant_id])))
  end

  def show
    @cart = Cart.find(session[:cart_id])
  end
end