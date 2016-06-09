class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :set_user!, except: [:create, :index, :new]
  before_action :admin_only, only: :destroy

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, alert: 'Access denied.'
      end
    end
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])
    @user.update(password params[:password])
    redirect_to user_path(id: @user.id)
  end

  def new
  end

  def update
    if @user.update_attributes(role_params)
      redirect_to users_path,  notice: 'Updated user.'
    else
      redirect_to users_path, alert: 'Cannot update user.'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Successfully deleted user.'
  end

  private

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, alert: 'You are not authorized to do that.'
    end
  end

  def role_params
    params.require(:user).permit(:role)
  end

  def set_user!
    @user = User.find(params[:id])
  end
end
