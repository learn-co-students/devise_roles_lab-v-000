class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  def new
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])
    @user.update(password: params[:password])

    redirect_to user_path(id: @user.id)
  end

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin? || @user == current_user
      @user.destroy
      redirect_to users_path
    else
      redirect_to users_path, :alert => "Access denied."
    end
  end
end
