class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip?
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
