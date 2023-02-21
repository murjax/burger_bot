Rails.application.routes.draw do
  devise_for :users
  resources :orders, only: %i[index show new create]
  resources :ingredients, only: %i[index new edit create update destroy]
  resources :price_sheets, only: %i[index new edit create update destroy]
  resources :price_sheet_ingredients, only: %i[new edit create update destroy]

  root 'orders#index'
end
