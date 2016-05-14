class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.role == 'admin' || @post.user = current_user
      @post.destroy
      redirect_to posts_path
    end
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user.role == ('vip' || 'admin') || @post.user = current_user
      @post.update(post_params) if @post
      redirect_to @post
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
