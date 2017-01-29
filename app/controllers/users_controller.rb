class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    if current_user.id != params[:id].to_i
      flash[:notice] = "Access denied."
      redirect_to users_path
    end
    
    if params[:id] == "sign_out"
      flash[:notice] = "Signed out successfully."
    end
  end

  def update
    is_admin? && User.find(params[:id]).update
  end

  def destroy
    is_admin? && User.find(params[:id]).delete
  end
  
  private
  
  def is_admin?
    !current_user.nil? && current_user.role == "admin"
  end
end
