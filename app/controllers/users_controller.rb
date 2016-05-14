class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to users_path, alert: "Access denied."
    end
  end

  def destroy
    # return head(:forbidden) unless current_user.admin?
      @user = User.find(params[:id])
      if current_user.admin?
        @user.destroy
      end
      redirect_to new_user_session_path, alert: "Signed out successfully."
  end

end
