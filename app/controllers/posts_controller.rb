class PostsController < ApplicationController
  before_action :authenticate_user!
  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? ||
      current_user.vip? ||
      current_user.try(:id) == @post.id
    @post.update(post_params)
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    return head(:forbidden) unless current_user.admin? ||
      current_user.vip? ||
      current_user.user?
    @post.save
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
