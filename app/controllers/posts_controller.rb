class PostsController < ApplicationController
  
  def new
  end
  
  def index
    @posts = Post.all
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end


  def show
  end

  def edit
  end


  def update
   @post = Post.find(params[:id])
   #user = @post.user
    if current_user.admin? || current_user.vip?
      @post.update(post_params)
        redirect_to @post
      else
        flash[:notice] = "You do not have authorization to perform this action"
      end
  end


    private
    def post_params
      params.require(:post).permit(:user, :content)
    end
end
