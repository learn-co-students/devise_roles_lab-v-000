class UsersController < ApplicationController
  before_action :admin_only, only: [:update, :destroy]

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => "Access denied."
    end
  end
end
