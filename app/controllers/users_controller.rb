class UsersController < ApplicationController

  before_action :find_user!, only: [:edit, :show, :update]
  before_action :confirm_user, only: :show
  before_action :admin_only, only: :destroy

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  def update
    if @user.update
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def edit
  end

  private

  def find_user!
    @user = User.find(params[:id])
  end

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => "Access denied."
    end
  end

  def confirm_user
    unless current_user == @user
      redirect_to users_path, :alert => "Access denied."
    end
  end

end
