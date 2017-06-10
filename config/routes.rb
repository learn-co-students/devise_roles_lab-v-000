Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

	resources :posts

 	delete '/users/:id' => 'users#destroy'
  resources :users
end
