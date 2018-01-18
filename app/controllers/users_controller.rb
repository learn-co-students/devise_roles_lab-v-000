class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.create(user_params)
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
    if current_user.admin? || current_user == @user.id
      @user.delete
      flash[:notice] = "Signed out successfully."
      redirect_to '/'
    else
      return head(:forbidden)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
