class UsersController < ApplicationController
	
	def index

	end

	def destroy
		@user = User.find(params[:id])
		return head(:forbidden) unless current_user.admin?
		@user.destroy
		redirect_to root_path
	end

	def edit

	end

	def show
		@user = User.find(params[:id])
		
		if @user.id != current_user.try(:id)
			flash[:alert] = "Access denied."
		  	redirect_to users_path
		 end
	end

	private

	def user_params

	end
end
