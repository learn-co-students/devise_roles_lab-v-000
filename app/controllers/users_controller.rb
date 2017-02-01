class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
   @user = User.find_by_id(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.delete
    redirect_to users_path
  end
end
