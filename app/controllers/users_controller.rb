class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
    if !current_user.admin? && current_user != @user
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
    end
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
