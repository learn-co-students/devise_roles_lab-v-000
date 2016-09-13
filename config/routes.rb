Rails.application.routes.draw do

  devise_for :users

  root to: 'users#index'
  resource :users
  # for some reason my user_path was not auto generated so I had to add this
  get '/users/:id', :to => 'users#show', :as => :user
  resources :posts
end
