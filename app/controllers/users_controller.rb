class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		if !current_user.admin? && current_user != @user
			flash[:alert] = "Access denied."
		end
	end

	def update
		@user = User.find(params[:id])
		return head(:forbidden) unless current_user.admin?
		@user.update(user_params)

		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find(params[:id])
		return head(:forbidden) unless current_user.admin?
		@user.destroy

		redirect_to user_path
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
