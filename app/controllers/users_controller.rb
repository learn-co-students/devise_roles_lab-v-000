class UsersController < ApplicationController
  before_action :user, only: [:update, :destroy, :show]
  before_action :authorize_user, only: [:update]
  before_action :admin_only, only: :destroy
  def new

  end

  def create
    @user = User.find_or_create_by(email: params[:email], password: params[:password])

    redirect_to user_url(@user)
  end

  def index
    @users = User.all
  end

  def show
    unless current_user == @user || current_user.admin?
      flash[:alert] = "Access denied."
      redirect_to root_path
    end

  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User deleted."
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def is_admin?
    if current_user.admin?
    end
  end

  def admin_only
    unless current_user.admin?
      redirect_to '/', alert: "Access denied"
    end
  end

  def authorize_user
    unless current_user.admin? || current_user.vip?
      redirect_to '/', alert: "Access denied"
    end
  end


end
