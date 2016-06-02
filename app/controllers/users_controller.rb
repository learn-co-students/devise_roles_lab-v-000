class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if !(current_user = @user) || !current_user.admin?
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
      redirect_to root_path, :notice => "User deleted"
    else
      redirect_to root_path, :warning => "Access denied."
    end
  end


end
