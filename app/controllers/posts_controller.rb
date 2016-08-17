class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post!, only: [:show, :edit, :update]
  before_action :authorize_user!, only: [:edit, :update]

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to post_path(id: @post.id)
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def authorize_user!
    raise "Unauthorized!" unless current_user

    unless current_user == @post.user || current_user.vip? || current_user.admin?
      redirect_to post_path(id: @post.id), alert: "Access denied."
    end
  end

  def find_post!
    @post = Post.find(params[:id])
  end
end