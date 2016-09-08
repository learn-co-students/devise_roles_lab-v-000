class PostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
