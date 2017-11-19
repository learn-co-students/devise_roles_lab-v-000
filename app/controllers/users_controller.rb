class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path, notice: "Access denied."
    end
  end

  def update
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.update
    redirect_to root_path
  end

  def destroy
    if user_signed_in?
      @user = User.find(params[:id])
      return head(:forbidden) unless current_user.admin?
      @user.delete
    end
    redirect_to root_path
  end

end
