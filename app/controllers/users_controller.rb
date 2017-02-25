class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new, :index]
  before_action :set_user

  def index
    @users = User.all
  end

  def new

  end

  def create

  end

  def show
    unless current_user.admin? || @user == current_user
      redirect_to root_path, notice: "Access denied."
    end
  end

  def update

  end

  def destroy
    @user.destroy if current_user.admin?
    redirect_to root_path
  end

  private

  def set_user
    @user ||= User.find_by(id: params[:id])
  end
end
