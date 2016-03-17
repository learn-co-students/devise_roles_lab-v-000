class UsersController < ApplicationController

  def index
     @user = current_user
   end
 
   def create
     user = User.create(params[:user])
   end
 
   def show
     @user = User.find_by(id: params[:id])
     unless @user == current_user || current_user.try(:admin?) 
     redirect_to root_path, notice: "Access denied."
   end
 end
 
end