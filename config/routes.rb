Rails.application.routes.draw do
  resources :posts, only: [:update]
  devise_for :users

  root to: 'users#index'

  resources :users, only: [:index, :show, :destroy]
end
