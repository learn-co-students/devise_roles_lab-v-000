class PostsController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def show
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    redirect_to posts_path
  end


  private

    def post_params
      params.require(:post).permit(:content)
    end
end
