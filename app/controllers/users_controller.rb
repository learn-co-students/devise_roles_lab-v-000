class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])
    @user.update(password: params[:password])
    redirect_to user_path(id: @user.id)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, alert: "Access denied."
      end
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: "User updated."
    else
      redirect_to users_path, notice: "Unable to to update user."
    end
  end

  def destroy
    if current_user.admin?
      @user = User.find_by(id: params[:id])
      @user.destroy
      redirect_to users_path, notice: "User deleted."
    else
      redirect_to users_path, notice: "User unable to be deleted."
    end
  end

  private
  def user_params
    params.require(:user).permit(:role)
  end
end
