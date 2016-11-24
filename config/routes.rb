Rails.application.routes.draw do
  devise_for :users

  root to: 'visitors#index'
  get '/login', to: 'users#login'

  resources :users
  resources :posts
end
