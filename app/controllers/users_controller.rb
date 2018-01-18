class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
     if !current_user.admin? || current_user != @user
      flash[:error] = "Access denied."
       #redirect_to '/'
     end

  end

  def destroy
     @user = User.find(params[:id])
    if current_user.admin?
     @user.delete
      redirect_to root_path
    else
      flash[:notice] = "You do not have authorization to perform this action"
    end
  end
end
