class UsersController < ApplicationController
  load_and_authorize_resource 

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

end