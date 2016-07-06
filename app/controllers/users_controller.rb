
class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to users_path, alert: "Access denied." unless current_user == @user
  end

  def update
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
