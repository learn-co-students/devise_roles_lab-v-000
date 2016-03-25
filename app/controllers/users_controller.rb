class UsersController < ApplicationController
  # before_action :check_if_logged_in
  # before_action :assign_current_user
  # skip_before_action :check_if_logged_in, :assign_current_user, only: [:new, :create]


  def index
    
  end

  def new
    
  end

  def create

  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user != @user
      redirect_to root_path, notice: "Access denied."
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end


  private

  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end

  # def check_if_logged_in
  #   if !logged_in?
  #     redirect_to new_user_session_path
  #   end
  # end

  # def logged_in?
  #   !!session[:user_id]
  # end

  # def current_user
  #   if logged_in?
  #     User.find(session[:user_id])
  #   end
  # end

  # def assign_current_user
  #   @user = current_user
  # end
end
