class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    return head(:foridden) unless current_user.admin? ||
                          current_user.vip? ||
                        current_user.try(:id) == @post.id
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    return head(:foridden) unless current_user.admin? ||
                          current_user.vip? ||
                        current_user.try(:id) == @post.id
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end
