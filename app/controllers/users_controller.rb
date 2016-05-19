class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
  end

  def create
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

end
