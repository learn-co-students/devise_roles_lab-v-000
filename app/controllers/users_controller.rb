class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end
  
  def show
    @user = User.find(params[:id])
    unless @user == current_user || @user.try(:admin?)
      redirect_to root_path, alert: "Access denied."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role)
  end


end