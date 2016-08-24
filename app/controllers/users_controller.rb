class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin? 
    @user.destroy
    flash[:notice] = "User has been deleted."
    redirect_to root_path
  end
  
end