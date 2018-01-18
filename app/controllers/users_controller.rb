class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user && !current_user.admin?
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    if current_user.role == "admin"
      @user = User.find(params[:id])
      @user.delete
      flash[:message] = "#{@user.name} has been deleted."
      redirect_to users_path
    else
      flash[:error] = "Action forbidden."
      redirect_to users_path
    end
  end
end
