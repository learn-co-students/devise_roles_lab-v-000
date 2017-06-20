class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :show, :update]

  def update
    @post.update(post_params)

    redirect_to post_path(@post)
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
