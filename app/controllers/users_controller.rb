class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user), flash[:alert] = "Access denied."
    end
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
