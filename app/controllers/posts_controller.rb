class PostsController < ApplicationController

  def update
    if current_user.role != "user"
      @post = Post.find_by(:id => params[:id])
      @post.update(post_params)
    end

    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

end
