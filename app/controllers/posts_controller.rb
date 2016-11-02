class PostsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    if current_user.vip? || current_user.admin?
      @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
