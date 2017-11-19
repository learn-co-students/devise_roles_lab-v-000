class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create

  end

  def new

  end

  def edit

  end

  def show
    @user = User.find_by_id(params[:id])
    authorize! :read, @user
  end

  def update

  end

  def destroy
    user = User.find_by_id(params[:id])
    authorize! :destroy, user
    user.destroy
    redirect_to root_path
  end

end
