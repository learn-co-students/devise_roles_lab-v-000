class PostsController < ApplicationController
  before_action :require_login
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def show

  end

  def edit
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "post was saved!"
      redirect_to post_path
    else
      render 'new'
    end

  end



  def update
    if @post.update(post_params)
      flash[:success] = 'post was updated!'
      redirect_to root_path
    else
      render 'edit'
    end

  end

  def destroy

    if @post.destroy
      flash[:success] = 'post was destroyed!'
      redirect_to root_path
    else
      flash[:warning] = 'Cannot destroy this post...'
    end
    redirect_to root_path

  end

  private

  #def require_admin
  #  binding.pry
  #end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end

  #def require_login
  #  redirect_to root_path unless !current_user.nil?
  #end

end
