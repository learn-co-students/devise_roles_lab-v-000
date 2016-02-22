class PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post)
    else
      redirect_to posts_path, flash: "Unable to create post"
    end  
  end

  def index
    @posts = Post.all
  end
  
  def show
    find_post
  end  

  def edit
    find_post
  end

  def update
    find_post
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    find_post
    @post.delete
    redirect_to posts_path    
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end  

    def find_post
      @post = Post.find(params[:id])
    end  
end  