class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
    end
    redirect_to root_path
  end
end
