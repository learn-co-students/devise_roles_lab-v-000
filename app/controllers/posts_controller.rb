class PostsController < ApplicationController
  def update
    @post ||= Post.find_by(id: params[:id])
    if current_user.id == @post.user_id || current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
