class UsersController < ApplicationController
	before_action :set_user, only: [:destroy, :show]

	def index
		
	end

	def show
		# set_user
		unless @user == current_user
			redirect_to root_path, alert: "Access denied."
		end	
	end

	def destroy
		if current_user.admin?
			# set_user
			@user.destroy			
		else
			return head(:forbidden)
		end
		redirect_to root_path
	end

	private

	def set_user
		@user = User.find_by(id: params[:id])
	end
end
