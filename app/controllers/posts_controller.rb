class PostsController < ApplicationController
	before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)    
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
