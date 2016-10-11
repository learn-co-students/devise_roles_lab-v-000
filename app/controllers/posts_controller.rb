class PostsController < ApplicationController

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params) if current_user.admin? || current_user.vip?
    redirect_to post_path(@post)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
