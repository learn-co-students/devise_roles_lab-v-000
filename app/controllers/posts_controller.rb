class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	load_and_authorize_resource except: [:create]
	
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.owner = current_user
		@post.save
		redirect_to posts_path
	end

	def edit
		
	end

	def show
		
	end

	def update
		@post.update(post_params)
		redirect_to posts_path
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end

	def set_post
		@post = Post.find(params[:id])
	end

	
end
