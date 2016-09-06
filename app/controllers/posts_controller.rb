class PostsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if !current_user.admin? && !current_user.vip? && current_user != @user
      flash[:alert] = "Access denied."
    else
      @post.update(post_params)
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :owner, :content)
  end
end
