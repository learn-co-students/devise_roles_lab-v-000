class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def show
    unless current_user == @user
      redirect_to users_path, alert: "Access denied."
    end
  end

  def new
  end

  def create
    @user = User.find_or_create(user_params)
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
    if current_user.admin?
      @user.update(user_params)
      redirect_to user_path(@user), alert: "User successfully updated."
    else
      redirect_to users_path, alert: "You are not authorized to perform this action."
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
      redirect_to users_path, alert: "User successfully deleted."
    else
      redirect_to users_path, alert: "You are not authorized to perform this action."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

end
