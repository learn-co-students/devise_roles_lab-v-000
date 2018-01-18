class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy
  before_action :correct_user, only: :show
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all
  end

  def show
    if correct_user
      @user = User.find(params[:id])
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  private
  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def correct_user
    user = User.find(params[:id])
    current_user == user
  end


end
