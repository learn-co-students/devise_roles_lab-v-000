class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :show, :update]
  before_action :authorize_user, only: [:edit, :update]

  def update
    @post.update(content: params[:post][:content])

    redirect_to post_path(@post)
  end

  private
  def authorize_user
    raise "Unauthorized!" unless current_user

    unless current_user == @post.user || current_user.vip? || current_user.admin?
      redirect_to post_path(@post), :alert => 'Access denied.'
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
