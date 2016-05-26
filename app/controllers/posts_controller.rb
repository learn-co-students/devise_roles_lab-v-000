class PostsController < ApplicationController
  before_filter :set_post, :only => [:edit,:update,:create]
  def index

  end

  def show

  end

  def edit

  end

  def update
    if current_user.vip? || current_user.admin?
      @post.update(post_params)
      render 'show'
    else
      redirect_to new_user_session_path
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end

end
