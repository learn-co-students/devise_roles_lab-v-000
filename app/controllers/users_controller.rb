class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
	end

	def show
		if current_user.id != params[:user_id]
			# puts "current user id #{current_user.id}"
			# puts "params id #{params[:id]}"
      		flash[:notice] = "Access denied."
      		redirect_to root_path
      	end
	end

	def edit
	end

	def update
	end

	def destroy
		if current_user.try(:admin?)
			@user = User.destroy(params[:id])
		end
	end
end