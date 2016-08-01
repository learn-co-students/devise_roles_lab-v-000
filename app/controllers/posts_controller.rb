class PostsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def create
    @post.user = current_user
    @post.save
    redirect_to root_path
  end

  def update
    @post.update_attributes(post_params)
    redirect_to root_path 
  end

  private 

  def post_params
    params.require(:post).permit(:content)
  end

end
