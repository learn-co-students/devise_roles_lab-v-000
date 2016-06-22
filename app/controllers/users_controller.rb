class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :is_admin?, only: [:update, :destroy]


  def new
  end

  def create
    @user = User.find_or_initialize_by(user_params)
    redirect_to user_path(id: @user.id)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to '/'
    end
  end

  def update
    @user = User.find(params[:id])

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User deleted."
  end

  private

  def is_admin?
    @user = User.find(params[:id])
    if !current_user.admin? 
      redirect_to users_path, alert: "Access denied."
    end

  end

  def user_params
    params.require(:user).permit(:role, :email, :password)
  end



end
