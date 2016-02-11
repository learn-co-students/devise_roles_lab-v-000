class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :index]
 
  def show
    unless current_user == @user
      redirect_to root_path, alert: "Access denied."
    end
  end

  def index
    @users = User.all
  end

  def edit
    redirect_to users_path, alert: "You cannot change another user's details" if current_user != @user
  end

  def update
    if current_user.try?(:admin) || current_user == @user
      @user.update_attributes(secure_params)
      redirect_to users_path, notice: "User details updated"
    else
      redirect_to users_path, alert: "You cannot change another user's profile"
    end
  end

  def destroy
    if current_user.try?(:admin) || current_user == @user
      session.clear
      @user.delete
      redirect_to new_user_path, notice: "Your account has been deleted"
    else
      redirect_to user_path, alert: "You are not authorized to delete another user's account"
    end
  end

  
  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :role)
    end

end