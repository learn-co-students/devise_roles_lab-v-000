class PostsController < ApplicationController

  load_and_authorize_resource only: :update

  def update
    @post.update(update_params)
    redirect_to root_path
  end

  private

  def update_params
    params.require(:post).permit(:content)
  end
end
