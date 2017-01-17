Rails.application.routes.draw do
  devise_for :users

  # root to: 'users#index'
  root to: 'welcome#home'

  resources :users
  resources :posts
end
