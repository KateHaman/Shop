Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :products, only: %i[index show] do
    resources :categories, only: %i[index show]
  end

  resources :products do
    resources :order_items, only: %i[create update destroy]
    post 'order_items/:id/add', to: 'order_items#add_quantity', as: 'order_item_add'
    post 'order_items/:id/reduce', to: 'order_items#reduce_quantity', as: 'order_item_reduce'
  end
  resources :orders
  get 'orders/:id/', to: 'products#index'
  root 'products#index'
end

