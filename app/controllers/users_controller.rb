class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :delete, @user
    @user.destroy
    redirect_to root_path
  end
end
