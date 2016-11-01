class UsersController < ApplicationController
  before_action :set_user!, except: [:create, :index, :new]
  before_action :admin_only, only: :destroy

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])
    @user.update(password: params[:password])
    redirect_to user_path(id: @user.id)
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      redirect_to root_path, alert: "Access denied."
    end
  end

  def destroy
    @user.destroy
    flash[:alert] = "Signed out successfully."
    redirect_to users_path
  end

  private

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => "Access denied."
    end
  end

  def set_user!
    @user = User.find(params[:id])
  end

end
