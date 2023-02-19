Rails.application.routes.draw do
  resources :orders
  resources :burger_components
  root 'orders#index'
end
