class UsersController < ApplicationController
  def index

  end

  def destroy
    if current_user.admin?
      current_user.destroy
    end
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end
end
