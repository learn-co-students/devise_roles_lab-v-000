class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_or_owner, only: [:update, :destroy]

  def index
    @users = User.all
  end

  def new

  end

  def create

  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => 'Access denied.'
      end
    end
  end

  def edit
    
  end

  def update
    @user.update(user_params)
    redirect_to users_path, notice => "Successfully updated user."
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice => "Successfully deleted user."
  end

  private

  def admin_or_owner
    return head(:forbidden) unless current_user.admin? || @user == current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end
end
