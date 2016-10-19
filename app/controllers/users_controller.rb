class UsersController < ApplicationController

  def index
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to new_user_session_path
  end
end
