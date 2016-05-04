class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to user_path(current_user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip?
      @post.update(content: params[:post][:content])
      redirect_to posts_path(@post)
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to user_path(current_user)
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
