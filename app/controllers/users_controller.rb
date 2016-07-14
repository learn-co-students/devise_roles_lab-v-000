class UsersController < ApplicationController
  before_action :set_user, except: [:create, :index, :new]
  before_action :admin_only, only: :destroy

  def index
    @users = User.all
  end

  def show
    unless @user == current_user
      redirect_to users_path, :alert => "Access denied."
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def admin_only
    unless current_user.admin?
      redirect_to users_path, alert: "Access denied."
    end
  end
end
