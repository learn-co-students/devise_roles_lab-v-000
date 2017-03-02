class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :show, :update]
  # def create
  # end

  def show
  end

  def edit
  end

  def update
    @post.update(content: params[:post][:content])
    redirect_to post_path(@post)
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
end
