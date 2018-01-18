class PostsController < ApplicationController

	def update
		
		@post = Post.find(params[:id])
		
		if current_user.try(:admin?) || current_user.try(:vip?) || current_user.try(:id) == @post.user_id
			@post.update(post_params)
			@post.save
		end
	end

	private
	def post_params
		params.require(:post).permit(:content)
	end

end