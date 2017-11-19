class PostsController < ApplicationController
  def update
    @post = Post.find_by_id(params[:id])
    authorize! :update, @post
    @post.update(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
