class PostsController < ApplicationController
	before_action :not_signed_in, except: [:index, :show] 
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	# load_and_authorize_resource except: [:create]
	
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
		user_access?
	end

	def show
		
	end

	def update
		user_access?
		@post.update(post_params)
		redirect_to posts_path
	end

	def destroy
		user_access?
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

	def not_signed_in
		if current_user.nil?
			redirect_to root_path, alert: "you are not authorized to view this page"
		end
	end

	def user_access?
		if current_user.user? && @post.owner != current_user
			redirect_to root_path, alert: "you are not authorized to view this page"
		end
	end



	
end
