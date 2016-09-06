class UsersController < ApplicationController
  # load_and_authorize_resource

  def index
    @user = current_user
  end

  def new
  end

  def create
  end

  def show
    @user = current_user
    if params[:id] != current_user.id
      flash[:alert] = "Access denied."
      redirect_to '/'
    end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params) if current_user.valid_password?(params[:user][:current_password])
  end

  def destroy
    @user = current_user
    @user.delete if current_user.admin?
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
