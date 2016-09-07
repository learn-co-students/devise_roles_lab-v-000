class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post!, only: [:show, :edit, :update]
  before_action :can_edit, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    @post.update(content: params[:post][:content])
    if @post.save
      redirect_to @post
    else
      render :edit, alert: 'Unable to save post.'
    end
  end

  private

  def can_edit
    unless current_user.admin? || current_user.vip? || current_user == @post.user
      redirect_to @post, alert: 'Access denied.'
    end
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
