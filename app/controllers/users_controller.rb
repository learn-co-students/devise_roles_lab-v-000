class UsersController < ApplicationController
  
  def index
    if current_user
      @user_email = current_user.email
    end
  end

  def show
    user = User.find(params[:id])
    @user_email = user.email
    if !current_user.admin? && current_user != user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
    else
      @user.destroy
    end
    redirect_to root_path
  end
end