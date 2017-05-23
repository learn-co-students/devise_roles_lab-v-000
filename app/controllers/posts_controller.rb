class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			redirect_to @post
		else
			return '/'
		end		
	end

	def show
		set_post
	end

	def edit
		set_post
	end

	def update
		set_post
		if current_user.admin? || current_user.vip? || @post.user
			@post.update(post_params)
			redirect_to post_path(@post.id)
		else
			redirect_to '/', :alert => "Access denied."	
		end	
	end

	def destroy
		set_post
		@post.user.inspect
		current_user.inspect
		if current_user.id != @post.user_id && !current_user.admin? 
			redirect_to '/', :alert => "Access denied."
		else
			@post.destroy
			redirect_to '/', :alert => "Post destroyed."	
		end	
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
