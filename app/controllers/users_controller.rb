class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user 
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy 
    if current_user.admin?
      current_user.destroy
    end
  end
  
end
