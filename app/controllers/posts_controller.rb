class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :admin_only, :except => :show, :index, :new, :create

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new 
  end

  def create
    if current_user
      @post = Post.new(post_params)
      @post.user_id = current_user.id 
      @post.save
      redirect_to @post
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id || current_user.admin? || current_user.vip?
      post.update(post_params)
      redirect_to post
    else
      flash[:notice] = "error"
      redirect_to posts_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id || current_user.admin? || current_user.vip?
      post.destroy
      redirect_to posts_path
    else
      flash[:note] = "error"
      redirect_to posts_path
    end
      # redirect_to posts_path
    
  end



  private

    def post_params
      params.require(:post).permit(:content)
    end

end
