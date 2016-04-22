class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user || @user.role != "user"
      redirect_to user_url(@user)
    else
      redirect_to :back, :alert => "Access denied."
    end

  end
end
