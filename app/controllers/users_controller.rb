class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def destroy
  end

end
