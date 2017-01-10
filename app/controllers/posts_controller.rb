class PostsController < ApplicationController



def update
	@post = Post.find(params[:id])
    if current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to @post
    else
      return head(:forbidden) 
    end
end

private

def post_params
	params.require(:post).permit(:content)
end





end
