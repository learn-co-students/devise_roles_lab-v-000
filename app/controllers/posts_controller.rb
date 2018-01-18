class PostsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    if current_user.try(:vip?) || current_user.try(:admin?)
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   if current_user.try(:admin?)
  #     @user.destroy
  #     redirect_to users_path
  #   else
  #     redirect_to users_path
  #   end
  # end

  def post_params
    params.require(:post).permit(:content)
  end
end
