class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(content: params[:post][:content])
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.user == current_user || current_user.vip? || current_user.admin?
      @post.update(content: params[:post][:content])
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), :notice => "Not authorized to edit post."
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.user == current_user || current_user.admin?
      @post.delete
    end
  end

  # private
  #
  # def post_params
  #   params.permit(:post).permit(:content)
  # end
end
