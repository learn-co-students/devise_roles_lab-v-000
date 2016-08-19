class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_user!, except: [:index, :create, :new]
  #before_action :authenticate_admin!, only: [:destroy]
  
  def index
    @users = User.all
  end

  def new
    
  end

  def create
    @user = User.create_by(email: params[:email], password: params[:password])
    redirect_to user_path(@user)
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to root_path
  end

  def edit
    
  end

  def update
    
  end

  def show
    unless current_user.admin? || current_user == @user
      redirect_to :back, alert: "Access denied."
    end
  end

  private

  def find_user!
    @user = User.find_by(id: params[:id])
  end

  def users_params
    params.require(:user).permit(:role)
  end

end
