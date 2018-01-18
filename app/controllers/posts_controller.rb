class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def create
    user_id = current_user.id

    Post.create(content: params[:post][:content], user_id: user_id)

    redirect_to user_path(id: user_id)
  end

  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip? || current_user.try(:id) == @post.id
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
