 class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to new_post
		else
			render :new
		end		
	end

	def show
		set_user
		if !current_user.admin? && current_user != @user
			redirect_to root_path, :alert => "Access denied."	
		end	
	end

	def edit
		set_user
	end

	def update
		set_user
	end

	def destroy
		set_user
		if current_user.admin?
			@user.destroy
			redirect_to '/'
		else
			redirect_to '/'
		end		
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
