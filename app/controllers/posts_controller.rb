class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    redirect_to post_path(@post.id)
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
  end


  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :user_id)
    end

end