class PostsController < ApplicationController
  before_action :authorize_user

  def index
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to root_path
  end

  def update
    @post = Post.find_by(params[:id])
    @post.update_attributes(post_params)
    redirect_to root_path 
  end

  private 

  def post_params
    params.require(:post).permit(:content)
  end

   


  def authorize_user
      unless current_user == @post.user || current_user.vip? || current_user.admin?
        redirect_to post_path(id: @post.id), :alert => "Access denied."
      end
  end

end
