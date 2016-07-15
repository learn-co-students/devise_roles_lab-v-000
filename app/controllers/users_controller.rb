class UsersController < ApplicationController
  
  def index
    @users=User.all
  end
  
  def show
    render text: "Access denied." unless current_user==User.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy if current_user.admin?
    render text: "hello there."
  end
  
  def endsesh
    reset_session
    render text: "Signed out successfully."
  end
end
