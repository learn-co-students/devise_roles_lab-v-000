class PostsController < ApplicationController
  before_action :admin_or_vip_only, only: [:edit, :update]

  def update
    @post = Post.find(params[:id])
    @post.update!(post_params)
    redirect_to post_path, id: @post.id
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def admin_or_vip_only
    raise "Unauthorized!" unless current_user

    unless current_user.admin? || current_user.vip?
      redirect_to posts_path, :alert => "Access denied."
    end
  end
end
