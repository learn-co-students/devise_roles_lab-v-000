class UsersController < ApplicationController
  before_action :admin_only, :except => [:show, :index]

  def new
  end

  def create
  end

  def index
    @user = current_user
    @users = User.all
  end

  def show
    if params[:id].to_i != current_user.id
      redirect_to '/', alert: "Access denied."
    end
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update

  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to '/users'
  end

  private
  def admin_only
    unless current_user.admin?
      redirect_to '/', alert: "Access denied."
    end
  end
end
