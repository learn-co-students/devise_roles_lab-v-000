Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users do
    resources :posts, only: [:new, :show, :index]
  end
  resources :posts
end
