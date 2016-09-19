class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(params[:id])
  end

  def new
    @post = @post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find_by(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip?
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip?
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
