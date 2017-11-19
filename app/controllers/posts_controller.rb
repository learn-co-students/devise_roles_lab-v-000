class PostsController < ApplicationController

  before_action :ensure_vip, only: [:update]

  def update
    @post = Post.find_by_id(params[:id])
    # binding.pry
    @post.update(post_params)
    redirect_to
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
