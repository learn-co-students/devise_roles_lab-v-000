Rails.application.routes.draw do
  get 'visitors/home'

  devise_for :users

  root to: 'visitors#home'

  resources :users

  resources :posts, only: [:update]
end
