class PostsController < ApplicationController
  before_filter :authenticate_user!

  def update
    @post = Post.find_by(id: params[:id])
    if current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
    
  end
  
  private

  def post_params
    params.require(:post).permit(:content)
  end
  
end
