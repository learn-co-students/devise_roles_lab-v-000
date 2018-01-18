class UsersController < ApplicationController


  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to users_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

end
