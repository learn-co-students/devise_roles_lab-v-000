class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post!, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_or_vip, only: [:update]
  before_action :require_admin, only: [:destroy]
  
  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end
  
  private
  
  def set_post!
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:content, :user_id)
  end
  
  def require_admin_or_vip
    unless current_user.admin? || current_user.vip?
      flash[:alert] = "Access denied."
      return redirect_to root_path
    end
  end
  
  def require_admin
    unless current_user.admin?
      flash[:alert] = "Access denied."
      return redirect_to root_path
    end    
  end
end
