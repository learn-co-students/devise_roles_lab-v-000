class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      redirect_to root_path, flash: {alert: 'Access denied.'}
    end
  end

  def create
  end

  def update
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip? ||  current_user.try(:id) == @user.id
    @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to '/'
  end

  private

    def user_params
      params.require[:user].permit[:email]
    end
end
