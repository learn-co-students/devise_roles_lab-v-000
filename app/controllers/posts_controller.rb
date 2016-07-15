class PostsController < ApplicationController
  def update
    Post.find(params[:id]).update(post_params)
    redirect_to "/"
  end
  
  private
  def post_params
    params.require(:post).permit(:content)
  end
end
