class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_user!, except: [:index, :new, :create]
  before_action :can_delete, only: :destroy

  def index
  end

  def show
    unless current_user.admin? || current_user.vip? || current_user == @user
      redirect_to users_path, :alert => "Access denied."
    end
  end

  def destroy
    current_user.destroy!
    redirect_to root_path, alert: 'User deleted.'
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def can_delete
    unless current_user.admin?
      redirect_to users_path, alert: 'Access denied.'
    end
  end
end
