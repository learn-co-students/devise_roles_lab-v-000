Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users
  get '/posts/edit', to: 'posts#update'
end
