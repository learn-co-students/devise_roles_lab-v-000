class UsersController < ApplicationController


  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to root_path
  end


  def update
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.update(user_params)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user.nil? || (current_user != @user && !current_user.admin?)
      flash[:alert] = "Access denied."
      redirect_to root_path
    end

  end


end
