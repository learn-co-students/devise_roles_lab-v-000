class UsersController < ApplicationController
	def index
		@user = current_user
	end

	def show
		@user = User.find(params[:id])
		if current_user == @user
			@user = current_user
		else
			flash[:error] = "Access denied."
			redirect_to root_path
		end
	end

	def destroy
		return head(:forbidden) unless current_user.admin?
		current_user.delete
		redirect_to root_path
	end
end