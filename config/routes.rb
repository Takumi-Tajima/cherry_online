Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :admins do
    root 'books#index'
    resources :books
  end

  resources :books, only: %i[index show]
  root 'books#index'

  resource :cart, only: %i[show] do
    resources :cart_items, module: :cart, only: %i[create destroy]
  end
end
