class PostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip?
      @post.update_attributes(post_params)
      redirect_to posts_path
    else
      return head(:forbidden) unless @post.user_id == current_user.id
      @post.update_attributes(post_params)
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
