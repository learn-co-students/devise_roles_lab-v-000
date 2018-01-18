class PostsController < ApplicationController
  def update
    @post = Post.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:admin?) || current_user.try(:vip?) || current_user.try(:id) == @post.user_id
    @post.update(post_params)
    redirect_to "/posts/#{@post.id}"
  end

  def create
    return head(:forbidden) unless current_user.try(:id)
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to "/posts/#{@post.id}"
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:admin?) || current_user.try(:id) == @post.user_id
    @post.destroy
    redirect_to '/'
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:admin?) || current_user.try(:vip?) || current_user.try(:id) == @post.user_id
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
