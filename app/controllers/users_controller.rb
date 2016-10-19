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
    binding.pry
    @user = User.find(params[:id])
    if current_user.id == @user.id
      redirect_to "/users/'#{current_user.id}'"
    end
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to new_user_session_path
  end
end
