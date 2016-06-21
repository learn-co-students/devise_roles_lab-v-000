class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all
  end

  def show
    if @user == current_user
      redirect_to '/'
    else
      flash[:message] = "Access denied."
    end
  end

  def destroy
    @user.destroy if @user.admin?
    redirect_to users_path, notice: 'Successfully deleted user.'
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
