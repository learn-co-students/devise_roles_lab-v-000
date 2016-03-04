class UsersController < ApplicationController
	load_and_authorize_resource

	def index
		@users = User.all
	end

	# def new
	# 	@user = User.new
	# end

	# def create
	# 	@user = User.create(user_params)
	# end

	# def show
	# end

	# private

	# def user_params
	# 	params.require(:user).permit(:name,:email, :password, :password_confirmation)
	# end

end