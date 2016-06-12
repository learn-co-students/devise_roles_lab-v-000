class UsersController < ApplicationController
	
	def destroy
		
		
		unless current_user.admin? 
			redirect_to users_path
		else
			@user = User.find(params[:id])
			@user.destroy
			redirect_to users_path
		end
	end
	
	def edit
		@user = User.find(params[:id])
		return head(:forbidden) unless @user.id = session[:user_id]
		
	end
	
	def index
		@user = current_user
	end
	
	def show
		@user = User.find(params[:id])
		if !current_user.admin? && @user != current_user
		 	flash[:alert] = "Access denied."
	 		redirect_to root_path	
		end
	end
	
end