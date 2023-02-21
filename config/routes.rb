Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :ingredients
  root 'orders#index'
end
