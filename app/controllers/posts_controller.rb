class PostsController < ApplicationController
	def update
		@post = Post.find(params[:id])
		return head(:forbidden) unless admin_or_vip?
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	private
	  def post_params
	  	params.require(:post).permit(:content)
	  end
end