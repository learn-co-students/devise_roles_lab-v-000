class UsersController < ApplicationController

  def home
    redirect_to root_path
  end

  def index
    @users = User.all
  end

  def create
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.id == current_user.id
      redirect_to users_path(@user)
    else
      redirect_to users_path, :alert => "Access denied."
    end
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to new_user_session_path
  end
end
