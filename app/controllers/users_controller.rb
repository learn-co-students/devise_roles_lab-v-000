class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    if current_user != @user
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.delete
    redirect_to users_path
  end
end
