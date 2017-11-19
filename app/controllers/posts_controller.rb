class PostsController < ApplicationController

  def edit
    # @post = Post.find_by(params[:id])
    # render partial: 'posts/_form', post: @post
  end

  def update
    post = Post.find_by(params[:id])
    if current_user.try(:id) == post.user_id || current_user.admin? || current_user.vip?
      redirect_to post_path(post) if post.update(post_params)
    else 
      redirect_to root_path, :alert => "Access denied."
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
