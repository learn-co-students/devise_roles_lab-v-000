class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update]
  before_action :find_user

  def show
  end

  def edit
  end

  def create
    Posts.create(content: params[:post][:content], user_id: @user.id)
    redirect_to user_path(id: @user.id)
  end
  def update
    @post.update!(content: params[:post][:content])
    redirect_to
  end



  private

  def authorization!
    raise "Not authorized to view this page!" unless current_user

    unless current_user == @post.user || current_user.vip? || current_user.admin?
      redirect_to post_path(id: @post.id), :alert => "You do not have access rights"
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def find_user
    current_user
  end
end
