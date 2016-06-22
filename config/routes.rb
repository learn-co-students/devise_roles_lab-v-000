Rails.application.routes.draw do
  get 'users/update'

  get 'users/destroy'

  resources :posts
  devise_for :users

  root to: 'visitors#index'

  resources :users

  
end
