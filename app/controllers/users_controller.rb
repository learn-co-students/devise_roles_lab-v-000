class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to users_path, alert: "Access denied." unless current_user == @user
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to users_path
  end

  # def show
  #   @user = User.find(params[:id])
  #   if !current_user.admin? && current_user != @user
  #     flash[:error] = "Access denied."
  #     redirect_to root_path
  #   end
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   if current_user.admin? || current_user == @user
  #     @user.destroy
  #   else
  #     flash[:error] = "Access denied."
  #   end
  #   redirect_to root_path
  # end

end
