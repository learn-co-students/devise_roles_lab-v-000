class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user || @user.admin?
      redirect_to root_path, :notice => "Access denied."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    reset_session
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end

end
