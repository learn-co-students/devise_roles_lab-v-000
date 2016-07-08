class PostsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  def update
    @post.update(post_params)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
