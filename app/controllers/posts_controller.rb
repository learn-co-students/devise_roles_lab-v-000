class PostsController < ApplicationController

  before_action :authenticate_user!

  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip? || current_user.try(:id) == @post.id
      @post.update(post_params)
    else
      return head(:forbidden)
    end
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.admin?
      @post.destroy
    else
      return head(:forbidden)
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
