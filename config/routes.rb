Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admins do
    root 'books#index'
    resources :books
  end

  root 'books#index'
  resource :cart, only: %i[show] do
    resources :cart_items, module: :cart, only: %i[create destroy]
  end

  resources :books, only: %i[index show]
  resources :orders, only: %i[index show create]
end
