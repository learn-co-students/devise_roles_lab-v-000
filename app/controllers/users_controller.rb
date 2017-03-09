class UsersController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def show
  end

  def edit
  end

  def destroy
    @user.delete
    redirect_to users_path
  end
end
