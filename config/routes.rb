Rails.application.routes.draw do

  
  devise_for :users

  root to: 'pages#home'

  resources :users

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :posts

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
  end

  devise_scope :user do
    delete '/logout' => 'devise/sessions#destroy'
  end

  devise_scope :user do
    get '/signup' => 'devise/registrations#new'
  end
end
