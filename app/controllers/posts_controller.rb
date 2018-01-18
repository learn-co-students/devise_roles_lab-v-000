class PostsController < ApplicationController

  before_action :authenticate_user!


  def update
    @post = Post.find(params[:id])
    return head(:forbidden) if current_user.user?
    @post.update(post_params)
    redirect_to root_path
  end



  private

  def post_params
    params.require(:post).permit(:content)
  end
end
