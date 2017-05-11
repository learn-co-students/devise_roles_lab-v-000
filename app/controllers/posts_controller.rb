class PostsController < ApplicationController
  before_action :set_post, only: [:update]
  before_action :authorize_user, only: [:edit, :update]

  def update
    @post.update(post_params)

    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def authorize_user
    return head(:forbidden) unless current_user

    unless current_user == @post.user || current_user.vip? || current_user.admin?
      return head(:forbidden)
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
