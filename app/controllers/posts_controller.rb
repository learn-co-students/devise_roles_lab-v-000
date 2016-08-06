class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def index
    @user = current_user
  end
  
  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    @post.update(posts_params)
    redirect_to post_path(@post)
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
  
end
