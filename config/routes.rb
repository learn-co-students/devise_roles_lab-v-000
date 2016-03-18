Rails.application.routes.draw do
  root to: 'visitors#index'

  get '/pages/about', to: 'visitors#about'
  devise_for :users
  resources :users
  resources :posts
end
