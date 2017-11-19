require 'pry'
class PostsController < ApplicationController
  before_action :logged_in?, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
  end

  def show
    @post = find_post
  end

  def edit
    @post = find_post
    if current_user.user? && @post.user_id != current_user.id
      redirect_to post_path(@post), alert: "Must be post owner, VIP, or Admin"
    end
  end

  def update
    @post = find_post
    if current_user.user? && @post.user_id != current_user.id
      redirect_to post_path(@post), alert: "Must be post owner, VIP, or Admin"
    else
      @post.update(post_params)
      @post.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = find_post
    if (current_user.user? || current_user.vip?) && @post.user_id != current_user.id
      redirect_to post_path(@post), alert: "Must be owner or Admin"
    else
      @post.destroy
      redirect_to posts_path
    end
  end

  private

  def logged_in?
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
