class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_only, :except => :show

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)
  end

  def show
    @user = User.find(params[:id])
    if current_user.id == @user.id 
      render :show
    else
      redirect_to :back, :alert => "Access denied."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    if current_user.id == @user.id 
      render :show
    else
      redirect_to :back, :alert => "Access denied."
    end
  end

  private

   def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def user_params
    params.require(:user).permit(:role, :email, :name, :password, :password_confirmation)
  end

end