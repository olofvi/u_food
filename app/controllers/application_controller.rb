class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
      unless current_user.nil?
        user = current_user
        user.update_attribute(:cart, @cart)
      end
    end
  end
end
