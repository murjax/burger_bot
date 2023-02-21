Rails.application.routes.draw do
  resources :orders
  resources :ingredients
  root 'orders#index'
end
