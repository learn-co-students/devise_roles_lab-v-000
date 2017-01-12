class PostsController < ApplicationController
  before_action :set_post

  def index
    check_logged_in do
      @posts = Post.all
    end
  end

  def new
    check_logged_in do
      @post = Post.new
    end
  end

  def create
    check_logged_in do
      @post = Post.create(post_params)
      redirect_to post_path(@post)
    end
  end

  def edit
  end

  def update
    if current_user.admin? || current_user.vip? || current_user.id == @post.user_id
      @post.update(post_params)
      redirect_to post_path(@post), notice: "Post updated."
    else
      redirect_to posts_path, alert: "Could not update."
    end
  end

  def show
    check_logged_in do
      render :show
    end
  end

  def destroy
  end

  private

  def set_post
    @post ||= Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
