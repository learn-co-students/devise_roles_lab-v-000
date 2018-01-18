class PostsController < ApplicationController

  def edit
  end

  def update
     @post = Post.find(params[:id])
     return head(:forbidden) unless current_user.admin? || current_user.vip?
     @post.update(post_params)
     redirect_to @post
   end



   private

   def post_params
     params.require(:post).permit(:content, :user_id)
   end



end
