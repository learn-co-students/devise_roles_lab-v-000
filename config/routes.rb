Rails.application.routes.draw do

  devise_for :users

  root to: 'users#new'

  resources :users
  
  resources :posts
end
