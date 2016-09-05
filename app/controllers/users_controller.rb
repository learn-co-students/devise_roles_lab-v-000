class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only: :destroy

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      render 'show'
    else
      redirect_to users_path, alert: "Access denied."
    end
  end

  def create
  end

  def update
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to users_path
    end
  end
end
