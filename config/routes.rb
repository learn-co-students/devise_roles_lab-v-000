Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users
  resources :posts 

  devise_scope :user do
    get '/signout' => 'devise/sessions#destroy'
  end



end
