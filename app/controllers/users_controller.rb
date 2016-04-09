class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if !@user.admin? && @user != current_user
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end
end
