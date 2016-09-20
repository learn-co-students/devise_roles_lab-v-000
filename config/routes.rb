Rails.application.routes.draw do
  
  get 'visitors/index'

  resources :posts
  devise_for :users
  root to: 'visitors#index'
  resources :users


  # devise_for :users
  # root to: 'users#index'
  # scope "/admin" do
  #   resources :users
  # end

end