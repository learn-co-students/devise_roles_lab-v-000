class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
      flash[:alert] = "Signed out successfully."
      redirect_to root_path
    else
      redirect_to users_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
