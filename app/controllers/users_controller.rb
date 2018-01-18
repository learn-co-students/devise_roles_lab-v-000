class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to users_path, alert: "Access denied." unless current_user.admin? || current_user.vip? || current_user == @user
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy if current_user.admin?
    redirect_to users_path
  end
end
