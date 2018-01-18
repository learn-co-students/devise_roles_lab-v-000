class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :set_user, except: [:create, :index, :new]
  before_action :admin_only, only: [:destroy, :show]

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
    @user = User.find_or_initialize(email: params[:email])
    @user.update(password: params[:password])

    redirect_to user_path(@user)
  end

  def update

  end

  def destroy
    @user.destroy
    redirect_to users_path, :alert => 'User deleted'
  end

  private

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => 'Access denied.'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
