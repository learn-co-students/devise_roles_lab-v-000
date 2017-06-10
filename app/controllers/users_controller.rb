class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:create, :new, :index]
	before_action :authorize_user_destroy!, only: [:destroy]
	before_action :authorize_user_view!, only: [:show]

	def index
	end

	def new
	end

#devise magic. Not sure how or when it gets added
	def create
		redirect_to '/users/sign_in', alert: 'Access denied.'
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = current_user
	end

	def update

	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to '/users/sign_in'
	end

	private

	def authorize_user_destroy!
		user = User.find(params[:id])
		unless (current_user == user || current_user.admin?)
			redirect_to '/'
		end
	end

	def authorize_user_view!
		user = User.find(params[:id])
		#admin, vip or owners can view
		unless (current_user == user || current_user.admin? || current_user.vip?)
			redirect_to '/', alert: 'Access denied.'
		end
	end
end
