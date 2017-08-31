class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url, notice: "Access denied." unless current_user.id == @user.id || current_user.admin?
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to root_path
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
