require 'pry'

class UsersController < ApplicationController
before_action :authenticate_user!, except: [:create, :new]

  
  def index
    @users = User.all
  end

  def login
    if user_signed_in?
      redirect_to '/users/registrations/new'
    else
      
    end
  end

  def show
    if @user != current_user
      redirect_to root_path, alert: "Access denied."
    end
  end

  def destroy
    if current_user.admin?
      current_user.destroy
      redirect_to users_path, notice: "Signed out successfully."
    else
    redirect_to user_path, notice: "Only admin can delete"
    end
  end
end
