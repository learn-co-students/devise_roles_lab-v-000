Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'
  post 'destroy' => 'users#destroy'
  post 'create' => 'posts#create'
  post 'update' => 'posts#update'

  resources :users
  resources :posts
end
