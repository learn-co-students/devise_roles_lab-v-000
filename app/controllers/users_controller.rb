class UsersController < ActionController::Base

	layout 'application'

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message + " Access denied."
	end

	def new

	end

	def create
		@user.new(user_params)
		@user.save
	end

	def edit

	end

	def update
		@user = User.find(params[:id])
		authorize! :update, @user
		@user.update(user_params)
	end

	def destroy
		@user = User.find(params[:id])
		authorize! :destroy, @user
		@user.destroy
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def index

	end

	def show
		@user = User.find(params[:id])
		authorize! :read, @user
	end

end