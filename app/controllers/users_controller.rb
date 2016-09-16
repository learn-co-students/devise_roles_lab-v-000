class UsersController < ApplicationController

  # NOTE: redirect to root path if user is not logged
  # NOTE: ensures that current_user is never nil
  before_action :authenticate_user!, except: [ :index]
  before_action :admin_only!, only: :destroy
  before_action :set_user!


  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
    redirect_to root_path, :alert => "Access denied." unless @user.id == current_user.id
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

private

  def set_user!
    @user = User.find_by(id: params[:id])
    return false
  end

  def admin_only!
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
      return false
    end
  end

end
