Rails.application.routes.draw do
  root 'products#index'

  resources :categories, only: %i[index show] do
    resources :products, only: %i[index show]
  end

  resources :products
end
