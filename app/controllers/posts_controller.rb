require 'pry'
class PostsController < ApplicationController
  before_action :authenticate_user!

  def update
   @post = Post.find_by(params[:id])
   @post.update_attributes(post_params)
   redirect_to root_path 
  end

  def show
  end

private
  def post_params
    params.require(:post).permit(:id, :content, :user_id)
  end

end