class PostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    if current_user && current_user == @post.user_id || current_user.vip? || current_user.admin?
      @post.update(post_params)
      redirect_to root_path
    else
      redirect_to root_path, flash: {alert: 'Access denied.'}
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
