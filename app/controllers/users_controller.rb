class UsersController < ApplicationController
  #authentication filter
  before_action :authenticate_user, except: [:index, :create, :new]
  #authorization filter
  before_action :authorize_user, except: [:create, :index, :new]
  # only admin can update or destroy users
  before_action :admin_user, only: [:update, :destroy]

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.find_or_create_by(email: params[:email])
    @user.update(password: params[:password])

    redirect_to user_path(@user.id)
  end

  def show
    unless current_user.admin? || @user == current_user
      redirect_to users_path
    end
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to '/'
  end

  private

    def authenticate_user
      @user = User.find(params[:id])
    end

    def authorize_user
      raise "Not Authorized" unless current_user

      unless current_user.admin? || current_user.vip? || current_user == @user
        render :text => "Access denied. You're not authorized to see that."
      end
    end

    def admin_user
      unless current_user.admin? || @user == current_user
        redirect_to users_path, :alert => "You're not an administrator allowed to see such things."
      end
    end
end