class PostsController < ApplicationController

  before_action :find_post
  before_action :ensure_logged_in
  before_action :ensure_post_owner, only: [:edit, :update, :destroy]

  def create
  end

  def show
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def ensure_post_owner
      unless @post.user == current_user || current_user.vip? || current_user.admin?
        redirect_to root_path, alert: "Access denied."
      end
    end

end
