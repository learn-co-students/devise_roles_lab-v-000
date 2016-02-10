class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def delete
    user = current_user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user.try(:admin?) || @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role)
  end
end
