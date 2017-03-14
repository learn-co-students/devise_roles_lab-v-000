class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:update, :destroy]
  before_action :check_user_permissions, only: [:show]

  def index
    @users = User.all
  end

  def show() end

  def edit() end

  def create() end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def check_user_permissions
    unless @user == current_user || current_user.vip? || current_user.admin?
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
