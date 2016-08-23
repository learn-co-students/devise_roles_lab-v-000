class PostsController < ApplicationController

  def show
    @post = find_post
  end

  def edit
    @post = find_post
  end

  def update
    @post = find_post
    if (!current_user.admin? || !current_user.vip?) && current_user != @post.user
      flash[:error] = "Access denied."
      redirect_to root_path
    end
    @post.update(post_params)
  end

  def destroy
    @post = find_post
    if (!current_user.admin? || !current_user.vip?) && current_user != @post.user
      flash[:error] = "Access denied."
      redirect_to root_path
    end
    @post.destroy
  end

  private

  def find_post
    Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end

end
