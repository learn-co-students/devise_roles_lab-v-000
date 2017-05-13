class PostsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? ||
        current_user.vip?
    @post.update(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
