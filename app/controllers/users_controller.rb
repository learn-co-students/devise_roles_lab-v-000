class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all

  end

  def show
    unless @user == current_user
      redirect_to users_path, alert: "Access denied."
    end
  end

  def update
    if !current_user.admin?
      flash[:alert] = "You do not have permission to edit user info."
      redirect_to root_path
    else
      user = User.find(params[:id])
      user.update(user_params)
      redirect_to users_path
    end
  end

  def destroy
    if !current_user.admin?
      flash[:alert] = "You are not authorized to delete users."
      redirect_to root_path
    else
      user = User.find(params[:id])
      user.destroy
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
