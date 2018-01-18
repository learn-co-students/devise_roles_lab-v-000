class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] != 'sign_out'
      @user = User.find(params[:id])
      if !current_user.admin? && current_user != @user
        flash[:alert] = "Access denied."
        redirect_to root_path
      end
    else
      current_user.destroy
      flash[:alert] = "Signed out successfully."
      redirect_to root_path
    end
  end

  def destroy
    if !current_user.admin?
      flash[:alert] = "Access denied."
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    end
  end
end
