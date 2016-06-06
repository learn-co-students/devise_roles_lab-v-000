class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = 'Access denied.'
      redirect_to root_path
    end
  end
  def destroy
    unless current_user.admin? || @user == current_user
      redirect_to users_path
      return
    end
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
