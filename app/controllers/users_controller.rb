class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, alert: 'Access denied.'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    return head(:forbidden) unless current_user.admin? ||
                       current_user.vip? ||
                   current_user.try(:id) == @user.id
    @user.update
  end

  def destroy
    @user = User.find_by(id: params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to root_path
  end
end
