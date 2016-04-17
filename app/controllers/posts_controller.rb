class PostsController < ApplicationController
  load_and_authorize_resource

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    @post.save
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find_by(id: params[:id])
    if current_user && current_user == @post.user
      @owner_viewing_post = true
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit([:content])
  end
end
