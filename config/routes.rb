Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users
  root to: 'users#index'
end
