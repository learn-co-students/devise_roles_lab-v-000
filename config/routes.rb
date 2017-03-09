Rails.application.routes.draw do
  devise_for :users

  root to: 'visitors#index'

  #resources :users
  scope "/admin" do
    resources :users, except: [:show]
  end

  get 'users/:id', to: 'users#show', as: "user_page"

  resources :posts
end
