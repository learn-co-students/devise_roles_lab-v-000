class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new, :index]
  before_action :set_user!, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def edit

  end

  def create

  end

  def update
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
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

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:role)
  end

  def user_params
    params.require(:user).permit(:role)
  end
end