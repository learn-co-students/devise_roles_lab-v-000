class UsersController < ApplicationController
  def create
    user = User.create(params[:user])
  end

  def update
    user = User.find(params[:id])
    if user.admin? || current_user == user
      user.update(params[:user])
    else
      # error message
    end
  end

  def show
    user = User.find(params[:id])
    if user.admin? || current_user == user
      @user = user
    else
      flash[:alert] = "Access denied."
    end

  end

  def destroy
    user = User.find(params[:id])
    if user.admin? || current_user == user
      user.destroy
    else
      # error message
    end
  end

  def index
    @users = User.all
  end
end
