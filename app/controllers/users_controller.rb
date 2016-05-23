class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(email: params[:email], password: params[:password])
    if user.save
      redirect_to user_path(@user)
    end
  end

  def edit
  end

  def update
    return head(:forbidden) unless current_user.admin?
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end