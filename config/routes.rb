Rails.application.routes.draw do

  devise_for :users

  root to: 'users#index'

  resources :users

  resources :posts

  delete '/sign_out', to: 'users#destroy'
end
