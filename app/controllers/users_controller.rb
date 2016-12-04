class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if !current_user.admin? || !(current_user = @user)
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
      redirect_to root_path, :notice => "User successfully destroyed"
    else
      redirect_to root_path, :warning => "Access denied."
    end
  end
end
