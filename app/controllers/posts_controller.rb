class PostsController < ApplicationController

  def update
    @post  = Post.find(params[:id])
    @user = @post.user_id
    authorize! :update, @user
    @post.update_attributes(post_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
