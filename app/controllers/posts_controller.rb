class PostsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :index

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
