class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def destroy
     @user = User.find(params[:id])

    if !current_user.admin?
      flash[:alert] = "Access denied."
      redirect_to root_path
    else
      User.destroy(@user.id)
    end  
  end

  def show 
    @user = User.find(params[:id])

    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end
end
