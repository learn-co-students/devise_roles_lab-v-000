class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post!, only: [:edit, :show, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update]

  def edit

  end

  def update
    @post.update(post_params)
    redirect_to root_path
  end

  def create
    @post = Post.create(content: params[:post][:content], user_id: current_user.id )
    redirect_to root_path
  end

  def show

  end

  def destroy
    @post = Post.find(params[:id])

    if current_user.admin? || current_user.id == @post.user_id
      @post.destroy
      redirect_to root_path
    else
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end


  private

  def authorize_user!
   raise "Unauthorized!" unless current_user

     unless current_user == @post.user || current_user.vip? || current_user.admin?
       redirect_to post_path(id: @post.id), :alert => "Access denied."
     end
  end

  def find_post!
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end

end
