Rails.application.routes.draw do
  resources :posts
  devise_for :users

  root to: 'welcome#index'

  resources :users

  get '/error', to: 'users#error'
end
