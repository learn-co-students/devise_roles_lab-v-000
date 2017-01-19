Rails.application.routes.draw do
  devise_for :users
  get '/signin' => 'devise/sessions#new'
  root to: 'visitors#index'
  resources :posts
  resources :users

end
