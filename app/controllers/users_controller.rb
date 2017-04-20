class UsersController < ApplicationController

  def show
    if current_user == @user
      @user = User.find(params[:id])
    else
      redirect_to '/', :alert => "Access denied."
    end
  end

  def destroy
    if current_user.admin?
      @user = User.find(params[:id])
      @user.destroy
    end
    redirect_to users_path
  end
end
