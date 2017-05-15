require 'pry'
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if current_user.admin?
      @user.destroy
    end
    redirect_to root_path
  end
end
