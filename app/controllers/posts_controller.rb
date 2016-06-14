class PostsController < ApplicationController
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params) if current_user.admin? || current_user.vip?
    
    redirect_to root_path
  end
  
  def destroy

  end
  
  def post_params
    params.require(:post).permit(:content)
  end
  
end
