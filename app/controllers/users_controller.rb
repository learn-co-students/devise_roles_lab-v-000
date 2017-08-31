class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :create, :new]

  def index
    @users = User.all 
  end  

  def new
    @user = User.new
  end  

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path, :alert => "Access denied." if @user != current_user

  end
  

  def create
  end  

  def destroy
    if !current_user.admin? 
      redirect_to user_path(current_user)
    else
      current_user.destroy
      redirect_to new_user_session_path
    end
    
  end

  private
  
  
end
