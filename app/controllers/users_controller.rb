class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:message] = "Access denied."
      redirect_to root_path
    else
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.delete
      redirect_to root_path
    else
      flash[:notice] = "You cannot delete users"
      redirect_to root_path
    end
  end
end
