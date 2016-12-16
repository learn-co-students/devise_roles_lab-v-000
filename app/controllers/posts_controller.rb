class PostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip? || current_user == @post.user
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
