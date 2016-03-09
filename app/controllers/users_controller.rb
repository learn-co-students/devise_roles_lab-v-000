class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if params[:id] == current_user.id
      @user = current_user
    elsif current_user.role == "vip" || current_user.role == "admin"
      @user = User.find(params[:id])
    else
      @user = current_user
      flash[:alert] = "Access denied."
    end
  end

end
