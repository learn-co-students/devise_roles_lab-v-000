class PostsController < ApplicationController
  before_action :set_post, only: [:create, :edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create

  end

  def show

  end

  def edit

  end

  def update
    return head(:forbidden) unless current_user.admin? || current_user.vip?
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy

  end

  private
    def set_post
      @post ||= Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end
end
