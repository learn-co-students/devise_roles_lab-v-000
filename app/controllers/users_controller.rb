class UsersController < ApplicationController 

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
    unless @user == current_user || @user.admin?
      redirect_to root_path, alert: "Access denied."
    end  
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end  
end  