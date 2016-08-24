class PostsController < ApplicationController
  
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end