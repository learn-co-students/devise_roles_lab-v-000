Rails.application.routes.draw do
  resources :posts
  devise_for :users

  root to: 'users#index'

  resources :users
end
