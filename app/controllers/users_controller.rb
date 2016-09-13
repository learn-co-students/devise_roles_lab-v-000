class UsersController < ApplicationController
  #load_and_authorize_resource

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create

  end

  def show
    flash[:alert] = "Access denied." unless current_user.id == params[:id]
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    user = User.find(params[:id])
    user.delete
    redirect_to :root
  end
end
