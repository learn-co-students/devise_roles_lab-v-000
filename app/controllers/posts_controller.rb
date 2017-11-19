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
    @post = current_user.posts.create(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    if !current_user.user?
      @post = Post.find(params[:id])
      @post.update(post_params)

      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user.user?
      current_user.posts.find(params[:id]).destroy
    elsif current_user.admin?
      Post.find(params[:id]).destroy
    end

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
