class PostsController < ApplicationController
	load_and_authorize_resource

	def update
		@post.update(post_params)
		redirect_to '/'
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end

end
