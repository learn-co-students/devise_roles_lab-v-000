class UsersController < ApplicationController
  before_action :set_user, except: [:create, :index, :new]
  before_action :admin, only: [:destroy, :show]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  def admin
    unless current_user.admin? || @user == current_user
      flash[:notice] = "Access denied."
      redirect_to users_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end