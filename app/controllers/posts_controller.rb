class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :destroy, :show]

	def index
		@posts = Post.all
	end

	def show
		# before_action
	end	


	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to post_path(@post), notice: "Post created"
		else
			render :new
		end
	end


	def edit
		# set_post
	end

	def update
		# set_post
		if @post.update(post_params)
			redirect_to post_path(@post), notice: "Update completed"
		else
			render :edit
		end
	end


	def destroy
		# set_post
		@post.destroy
		redirect_to root_path
	end


	private

	def post_params
		params.require(:post).permit(:content, :user_id)
	end

	def set_post
		@post = Post.find_by(id: params[:id])
	end
end
