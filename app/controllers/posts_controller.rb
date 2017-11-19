class PostsController < ApplicationController


  def new

  end



  def update
    @post = Post.find(params[:id])
    
    return head(:forbidden) unless current_user.user? || current_user.vip? || current_user.try(:id) == @post.id
    
    @post.update(post_params)
  
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

end
