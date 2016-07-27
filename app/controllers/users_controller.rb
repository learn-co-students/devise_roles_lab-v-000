class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new, :index]
  before_action :set_user!, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    unless current_user.admin? || current_user == @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    unless current_user.admin?
      flash[:alert] = "Access denied."
      return redirect_to root_path
    end
    @user.destroy
    redirect_to users_path
  end

  def update
    @user.update(user_params)
    redirect_to root_ath
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end
end
