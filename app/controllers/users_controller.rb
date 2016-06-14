class UsersController < ApplicationController
  def index
    @email = user_email
  end
  
  def show
    # binding.pry
    @email = user_email
    unless params[:id] == current_user[:id]
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end  

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    User.find(params[:id]).destroy if current_user.admin?
    redirect_to root_path
  end
  
  def user_email
    current_user.nil? ? @email = nil : @email = current_user[:email]
  end
end
