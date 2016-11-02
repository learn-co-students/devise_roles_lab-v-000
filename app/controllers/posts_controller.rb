class PostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
