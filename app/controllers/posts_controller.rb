class PostsController < ApplicationController
  def update
    if !current_user.user?
      @post = Post.find(params[:id])
      @post.update(post_params)
    end

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
