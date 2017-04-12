class UsersController < ApplicationController
  before_action :set_user!, except: [:index, :new, :create]

  def index
    @users = User.all

  end

  def new
   @user = User.new
  end

  def create
  end

  def show
    unless @user == current_user
      redirect_to root_path, alert: "Access denied."
    end
  end

  def edit
    unless @user == current_user
      redirect_to root_path, alert: "Access denied."
    end
  end

  def update
    unless @user == current_user
      redirect_to root_path
    end
  end

  def destroy
    if !current_user.admin?
      redirect_to user_path(current_user)
    else
      @user.destroy
      redirect_to '/'
    end
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end


end
