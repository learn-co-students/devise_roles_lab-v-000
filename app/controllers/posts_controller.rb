class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path
    else
      redirect_to new_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to post_path
    else
      flash[:alert] = "Access denied."
      redirect_to posts_path
    end

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
