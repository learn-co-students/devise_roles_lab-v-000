class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :set_user!, except: [:create, :index, :new]
  before_action :admin_only, only: :destroy

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.find_or_create_by(email: params[:email])
    @user.password = params[:password]
    @user.save

    redirect_to user_path(id: @user.id)
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    if @user.update_attributes(secure_params)
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end
end
