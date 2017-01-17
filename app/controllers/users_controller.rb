class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create, :index]
  before_action :authenticate_user!, except: [:create, :new]
  before_action :admin_rights, only: :destroy

  def new
  end

  def create
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to users_path, :alert => "Access denied."
      end
    end
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy

    redirect_to users_path, :notice => "Signed out successfully."
  end

  private

  def admin_rights
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => "Access Denied"
    end
  end

  def user_params
    params.require(:user).permit(:role)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
