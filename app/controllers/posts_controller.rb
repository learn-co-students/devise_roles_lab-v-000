class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if current_user.admin? || current_user.vip? || current_user.id == @post.user_id
      @post.content = params[:post][:content]
      @post.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
