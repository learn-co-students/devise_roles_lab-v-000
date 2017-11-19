class PostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
