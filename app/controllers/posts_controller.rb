class PostsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip? || current_user.id == @post.user_id
      @post.update(post_params)
    end
    redirect_to '/'
  end



  private
    def post_params
      params.require(:post).permit(:user_id, :content)
    end
end
