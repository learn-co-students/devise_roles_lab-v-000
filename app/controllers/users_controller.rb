class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user != @user && !current_user.admin?
      flash[:alert] = "Access denied."
      redirect_to '/'
    end
  end

  def new
  end

  def update
  end

  def destroy
    if current_user.admin? 
      User.find_by(id: params[:id]).destroy
      redirect_to '/'
    else
      flash[:alert] = "Request denied."
      redirect_to '/'
    end
  end

end
