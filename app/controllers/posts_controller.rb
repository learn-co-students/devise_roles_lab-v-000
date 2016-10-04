class PostsController < ApplicationController
  def update
    #don't allow if not admin or vip
    if !(current_user.admin? || current_user.vip? )
      redirect_to '/'
    else
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to '/'
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
