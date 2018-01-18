class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :set_user!, except: [:create, :new, :index]
  before_action :admin_restricted, only: :destroy
  
  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access Denied"
      end
    end
  end

  def new
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])
    @user.update(password: params[:password])
    redirect_to user_path(id: @user.id)
  end

  def edit
  end

  def update
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to '/'
  end

  private
  def admin_restricted
    return head(:forbidden) unless current_user.admin?
  end

  def set_user!
    @user = User.find(params[:id])
  end
end
