class PostsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip? || current_user = @post.user
      @post.update(content: params[:post][:content])
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def destroy
  end
end
