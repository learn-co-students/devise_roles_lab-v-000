class PostsController < ApplicationController



  def update
    @post = Post.find(params[:id])
    if current_user.vip? || current_user.admin?
      @post.update(post_params)
    else
      redirect_to root_path
    end
  end




private

  def post_params
    params.require(:post).permit(:content)

  end



end
