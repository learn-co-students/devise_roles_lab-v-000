class PostsController < ApplicationController
  before_action :authenticate_user!

  def update
    @post = Post.find(params[:id])

    unless current_user = @post.user || current_user.admin? || current_user.vip?
      redirect_to post_path(id: @post.id), :alert => "Access denied."
    end
    
    @post.update!(post_params)
    redirect_to post_path, id: @post.id
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
