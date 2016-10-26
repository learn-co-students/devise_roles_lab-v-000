class PostsController < ApplicationController
  def update
    @post = Post.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:admin?) || current_user.try(:vip?) || current_user.try(:id) == @post.user_id
    @post.update(post_params)
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
