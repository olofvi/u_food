Rails.application.routes.draw do
  root controller: :restaurants, action: :index
  resources :restaurants
  # get add_to_cart_path(:id), controller: :carts, action: :add_to_cart
  resources :carts do
    get :add_to_cart
  end
end
