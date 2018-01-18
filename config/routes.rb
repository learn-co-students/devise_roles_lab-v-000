Rails.application.routes.draw do
  devise_for :users
  resources :posts

  root to: 'users#index'

  resources :users
end
