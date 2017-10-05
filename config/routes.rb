Rails.application.routes.draw do


  root controller: :restaurants, action: :index
  resources :restaurants
  resources :cart
end
