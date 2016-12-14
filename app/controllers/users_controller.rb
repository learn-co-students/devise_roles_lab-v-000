class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      flash.alert = 'Access denied.'
      redirect_to '/'
    end
  end

  def destroy
    if current_user.role == "admin"
      User.find(params[:id]).delete
      redirect_to new_user_session_path
    else
      flash.alert = 'Access denied.'
      redirect_to '/'
    end
  end
end
