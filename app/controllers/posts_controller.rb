class PostsController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end

  def show
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to '/'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
