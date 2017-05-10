Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :posts
  resources :users, only: [:index, :show, :destroy]

  get '/goodbye' => 'application#goodbye'
end
