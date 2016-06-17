Rails.application.routes.draw do
  resources :posts
  devise_for :users

  resources :users
  root 'posts#index'
end
