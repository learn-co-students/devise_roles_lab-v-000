Rails.application.routes.draw do

  devise_for :users
  root to: 'users#index'
  get 'users' => 'users#index'
  devise_scope :user do
    get 'user' => 'devise/passwords#edit'
  end

  resources :posts

end
