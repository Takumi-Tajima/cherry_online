Rails.application.routes.draw do
  devise_for :admins

  namespace :admins do
    root 'books#index'
    resources :books
  end

  resources :books, only: %i[index show]
  root 'books#index'
end
