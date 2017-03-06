Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'
  post 'destroy' => 'users#destroy'
  # resources :posts
  post 'create' => 'posts#create'
  post 'update' => 'posts#update'

  resources :users
end
