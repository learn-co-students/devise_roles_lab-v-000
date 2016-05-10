class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
