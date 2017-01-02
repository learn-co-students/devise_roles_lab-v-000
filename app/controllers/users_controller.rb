class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    if current_user != @user
      flash[:notice] = "Access denied."
      redirect_to root_path
    end

  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.delete
      redirect_to root_path
    else
      flash[:notice] = "You need to be an admin."
      redirect_to root_path
    end
  end
end
