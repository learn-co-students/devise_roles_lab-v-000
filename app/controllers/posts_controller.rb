class PostsController < ApplicationController
  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    if current_user.vip? || current_user.admin? || current_user == @post.user
      @post = Post.find(params[:id])
    else
      redirect_to post_path(@post)
    end
  end

  def update
    @post = Post.find(params[:id])
    if current_user.vip? || current_user.admin? || current_user == @post.user
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.admin? || current_user == @post.user
      @post.destroy
      redirect_to root_path
    else
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def require_login
    redirect_to root_path unless current_user
  end
end
