class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_post!, only: [:edit, :show, :update, :destroy]
  before_action :admin_only, only: [:destroy]
  before_action :vip_or_admin_only, only: [:edit, :update]

  def new
  end

  def create
    Post.create(post_params)
    redirect_to user_path(id: user_id)
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(id: @post.id), alert: 'Post updated.'
    else
      redirect_to post_path(id: @post.id), alert: 'Access denied.'
    end
  end

  def destroy
    if @post.delete
      redirect_to posts_path, alert: 'Post deleted.'
    else
      redirect_to posts_path, alert: 'Access denied.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content)
  end

  def set_post!
    @post = Post.find_by(params[:id])
  end

  def admin_only
    unless current_user.admin? || @post.user == current_user
      redirect_to post_path(id: @post.id), alert: 'Access denied'
    end
  end

  def vip_or_admin_only
    unless current_user.admin? || current_user.vip? || @post.user == current_user
      redirect_to post_path(id: @post.id), alert: 'Access denied.'
    end
  end

end
