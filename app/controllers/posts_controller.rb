class PostsController < ApplicationController
	before_action :set_post!, only: [:edit, :show, :update, :destroy]
	

	def index
	end

	def new
		
	end

	def create

	end

	def edit
		
	end

	def show
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to @post
	end

	def destroy
		post = Post.find(params[:id])
		@post.destroy
		redirect_to user_path(current_user)
	end

	private

	def set_post!
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:content)
	end
end
