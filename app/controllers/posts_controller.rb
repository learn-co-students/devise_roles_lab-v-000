class PostsController < ApplicationController
    before_action :authenticate_user!


  def index
    @posts = Post.all
  end

  def show
  end

  def destroy
  end

  def new
    @post = Post.new
  end

  def create
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end



  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
