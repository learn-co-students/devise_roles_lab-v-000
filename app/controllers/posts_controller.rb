require 'pry'
class PostsController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
    if !(["vip", "admin"].include? current_user.role) && (Post.find_by(params[:port]).user != current_user)
      redirect_to posts_path
    end
    Post.find_by(params[:id]).update(post_params)
  end

  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content)
  end
end
