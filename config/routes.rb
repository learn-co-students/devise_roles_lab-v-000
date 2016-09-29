Rails.application.routes.draw do
  

  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :users, only: [:show, :index, :destroy]
  resources :posts  

  root to: 'users#index'


end
