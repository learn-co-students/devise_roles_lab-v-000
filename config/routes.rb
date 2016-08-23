Rails.application.routes.draw do
  resources :posts
  devise_for :users

  root to: 'visitors#index'

  resources :users

  get '/pages/about' => 'visitors#about'
end
