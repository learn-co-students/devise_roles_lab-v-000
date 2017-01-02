class PostsController < ApplicationController
  def edit

  end

  def update
    @post = Post.find(params[:id])

    if current_user.admin? || current_user.vip? || @post.user == current_user
      @post.update(post_params)
      redirect_to root_path
    else
      return head(:forbidden)
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :owner)
  end
end
