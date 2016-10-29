class PostsController < ApplicationController

	layout 'application'

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message + " Access denied."
	end

	def new

	end

	def create
		@post.new(post_params)
		@post.save
	end

	def edit

	end

	def update
		@post = Post.find(params[:id])
		authorize! :update, @post
		@post.update(post_params)
	end

	def destroy
		@post = Post.find(params[:id])
		authorize! :destroy, @post
		@post.destroy
	end

	def post_params
		params.require(:post).permit(:content, :user, :user_id)
	end

	def index

	end

	def show
		@user = User.find(params[:id])
		authorize! :read, @user
	end

end
