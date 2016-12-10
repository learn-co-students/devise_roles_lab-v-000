class PostsController < ApplicationController

  def update
     @post = Post.find(params[:id])

    if current_user.vip? || current_user.admin?
      @post.update(post_params)
      redirect_to post_path(@post)
    end
  end
  

  private 
  
  def post_params
    params.require(:post).permit(:owner, :content)
  end

end
