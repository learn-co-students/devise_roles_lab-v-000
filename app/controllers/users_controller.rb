class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    (redirect_to root_path, alert: "Access denied.") unless current_user == @user || current_user.admin?
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy if current_user.admin?
  end

end
