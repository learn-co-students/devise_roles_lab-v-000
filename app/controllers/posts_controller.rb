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
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params) if !current_user.user?
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
