# rake routes
                  Prefix Verb   URI Pattern                    Controller#Action
                   posts GET    /posts(.:format)               posts#index
                         POST   /posts(.:format)               posts#create
                new_post GET    /posts/new(.:format)           posts#new
               edit_post GET    /posts/:id/edit(.:format)      posts#edit
                    post GET    /posts/:id(.:format)           posts#show
                         PATCH  /posts/:id(.:format)           posts#update
                         PUT    /posts/:id(.:format)           posts#update
                         DELETE /posts/:id(.:format)           posts#destroy
        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
            user_session POST   /users/sign_in(.:format)       devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
           user_password POST   /users/password(.:format)      devise/passwords#create
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                         PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
       user_registration POST   /users(.:format)               devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
                         PATCH  /users(.:format)               devise/registrations#update
                         PUT    /users(.:format)               devise/registrations#update
                         DELETE /users(.:format)               devise/registrations#destroy
                    root GET    /                              users#index
                   users GET    /users(.:format)               users#index
                         POST   /users(.:format)               users#create
                new_user GET    /users/new(.:format)           users#new
               edit_user GET    /users/:id/edit(.:format)      users#edit
                    user GET    /users/:id(.:format)           users#show
                         PATCH  /users/:id(.:format)           users#update
                         PUT    /users/:id(.:format)           users#update
                         DELETE /users/:id(.:format)           users#destroy
                    page GET    /pages/*id                     high_voltage/pages#show                   high_voltage/pages#show


# rails g devise:controllers
Usage:
  rails generate devise:controllers SCOPE [options]

Options:
  -c, [--controllers=one two three]  # Select specific controllers to generate (confirmations, passwords, registrations, sessions, unlocks, omniauth_callbacks)

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Create inherited Devise controllers in your app/controllers folder.

Use -c to specify which controller you want to overwrite.
If you do no specify a controller, all controllers will be created.
For example:

  rails generate devise:controllers users -c=sessions

This will create a controller class at app/controllers/users/sessions_controller.rb like this:

  class Users::ConfirmationsController < Devise::ConfirmationsController
    content...
  end
