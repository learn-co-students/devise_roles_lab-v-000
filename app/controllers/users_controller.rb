class UsersController < ApplicationController
  def destroy
    @user = User.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:admin?) || current_user.try(:id) == @user.id
    @user.destroy
    redirect_to '/'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
