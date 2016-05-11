class PostsController < ApplicationController
  # load_and_authorize_resource
  # skip_authorize_resource :only => :index
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    if unauthorized?
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def update
    if unauthorized?
       flash[:alert] = "Access denied."
    else
      @post.update(post_params)
      flash[:notice] = "Post sucessfully updated."
    end
    redirect_to root_path
  end

  def destroy
    if !current_user.admin? && current_user != @post.user
       flash[:alert] = "Access denied."
    else
      @post.destroy
      flash[:notice] = "Post sucessfully deleted."
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:user, :content)  
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def unauthorized?
    !current_user.vip? && !current_user.admin? && current_user != @post.user
  end
end
