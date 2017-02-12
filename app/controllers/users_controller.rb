class UsersController < ApplicationController

  def destroy
    return head(:forbidden) unless current_user.admin?
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    render plain: "Access denied." unless current_user == @user
  end
end
