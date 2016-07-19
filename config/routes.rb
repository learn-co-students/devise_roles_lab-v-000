Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'users/sign_out' => 'users#endsesh'
  root to: 'users#index'

  resources :users
end
