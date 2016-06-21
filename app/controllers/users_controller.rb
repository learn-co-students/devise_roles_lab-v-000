class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all
  end

  def show
    redirect_to users_path, alert: "Access denied." unless current_user == @user
  end

  def destroy
    current_user.destroy if current_user.admin?
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
