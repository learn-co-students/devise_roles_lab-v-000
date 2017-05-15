class PostsController < ApplicationController
  before_action :find_post, only: [:create, :update, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    redirect_to post_path
  end

  def update
    @post.update(post_params)
    redirect_to post_path
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
