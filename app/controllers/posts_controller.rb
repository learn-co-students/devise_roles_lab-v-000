class PostsController < ApplicationController
  before_action :set_post, only: [:create, :show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(content: params[:post][:content], user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def show
  end

  def edit
  end

  def update
    @post.update(content: params[:post][:content])
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

    def set_post
      @post = Post.find_by(id: params[:id])
    end

end
