class UsersController < ApplicationController

	def new
	end

	def create
		@user = User.create(email: params[:email], password: params[:password])
		if patient.save
			redirect_to user_path(@user)
		end
	end

	def show
		@user = User.find(params[:id])
		if @user.admin? == false || @user.id != session[:id]
			redirect_to users_path, :alert => "Access denied."
		end
	end

	def index
		@users = User.all
	end

	def destroy

		@user = User.find(params[:id])

		if current_user.admin? || current_user == @user

			@user.destroy!
			redirect_to users_path 
		else
			redirect_to users_path, :alert => "Access denied."
		end
	end
end
