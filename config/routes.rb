Rails.application.routes.draw do
  
  resources :posts, only: [:update, :destroy]

  devise_for :users

  root to: 'users#index'

  resources :users
end
