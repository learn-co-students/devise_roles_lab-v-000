class UsersController < ApplicationController
   def show
     @user = User.find_by(id: params[:id])
     #binding.pry
     unless @user == current_user || current_user.try(:admin?) #|| current_user.vip?
       redirect_to root_path, notice: "Access denied."
     end
       
   end
   
   def create
     @user = User.create(params[:user])
   end
   
   def index
     @user = current_user  
   end
private
   def user_params
     params.require(:user).permit()
   end
end