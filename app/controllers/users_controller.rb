class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params)
    redirect_to user_path(@user)
  end

  def show
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @user.update(params)
    redirect_to user_path(@user)
  end

  def destroy
    if current_user.admin?
      @user.destroy
    end
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
