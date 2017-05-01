Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :users, only: [:show, :index, :destroy]
  resources :posts

end
