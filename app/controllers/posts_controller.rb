class PostsController < ApplicationController



  def new
    @user = current_user
    @post = @user.post.build
    redirect_to root_path
  end

  def create
    @post = Post.create(post_params)
  end

  def show
    @post = Post.find_by(id: params[:id])
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    return head(:forbidden) unless current_user.admin? || current_user.vip? || current_user == @post.user
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    return head(:forbidden) unless current_user.admin? || current_user == @post.user
    @post.update(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)

  end
end

  # - Posts can be created by any user
  # - Anyone can read any post
  # - Users can edit or delete Posts they own
  # - VIPs can edit anyone's Posts
  # - Admins can do anything to any post.
