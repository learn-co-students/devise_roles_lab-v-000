class PostsController < ApplicationController

	def update
		if current_user.admin? || current_user.vip?
			@post = Post.find(params[:id])
			if @post.update(post_params)
				redirect_to post_path
			end
		else
			flash[:alert] = "Access denied."
			redirect_to root_path
		end
	end

	private

    def post_params
      params.require(:post).permit(:content)
    end

end


