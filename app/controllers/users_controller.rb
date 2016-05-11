class UsersController < ApplicationController
  # load_and_authorize_resource
  # skip_authorize_resource :only => :index
  before_action :authenticate_user!, except: [:create, :new, :index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    if unauthorized?
      flash[:alert] = "Access denied."
      redirect_to root_path
    end 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  def update
    if unauthorized?
      flash[:alert] = "Access denied."
    else
      @user.update(user_params)
      flash[:notice] = "User sucessfully updated."
    end
    redirect_to root_path
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    flash[:notice] = "User sucessfully deleted."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def unauthorized?
    !current_user.admin? && current_user != @user
  end

end