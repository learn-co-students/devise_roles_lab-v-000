class UsersController < ApplicationController
before_action :authenticate_user!, except: [:create, :new]
before_action :admin_only, only: :destroy

  def index
    @users  = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = 'Access denied.'
      redirect_to root_path
    end

  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
     redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    if !current_user.admin?
      redirect_to users_path
    end
  end
end
