class PostsController < ApplicationController
#before_action :authenticate_user!
#before_action :find_post!, only: [:edit, :show, :update]
#before_action :authorize_user!
  def create
  binding.pry  
  end

  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip?
    @post.update(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
