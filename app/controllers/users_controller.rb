class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    if current_user.admin?
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:role)
    end
end
