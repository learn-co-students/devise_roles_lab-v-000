class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def edit

  end

  def update
  end

  def show
    check_logged_in do
      if current_user.admin? || current_user.id == params[:id].to_i
        render :show
      else
        redirect_to users_path, alert: "Access denied."
      end
    end
  end

  def destroy
    if current_user.admin? || current_user.id == params[:id].to_i
      @user.destroy
      redirect_to users_path, notice: "User deleted."
    else
      redirect_to users_path, alert: "Unable to delete user."
    end
  end

  private

  def set_user
    @user ||= User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :role)
  end
end
