class PostsController < ApplicationController
  load_and_authorize_resource 

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end