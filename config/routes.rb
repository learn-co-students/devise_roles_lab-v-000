Rails.application.routes.draw do
  get 'users/create'

  get 'users/create'

  devise_for :users

  root to: 'users#index'

  resources :users
end
