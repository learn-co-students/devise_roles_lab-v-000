class PostsController < ApplicationController

  def index

  end

  def new
    return head(:forbidden) unless current_user
    @post = Post.new
  end

  def create

  end

  def show

  end

  def edit
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.try(:id) == @post.id ||
      current_user.admin? ||
      current_user.vip?
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.try(:id) == @post.id ||
      current_user.admin?
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
