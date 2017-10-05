Rails.application.routes.draw do

  root controller: :restaurants, action: :show
  resources :restaurants
end
