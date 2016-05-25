class PostsController < ApplicationController
  # load_and_authorize_resource only: [:create, :update, :destroy]

  def index
    redirect_to new_user_session_path if !signed_in?
# byebug
    @posts=Post.all

  end

  def new

    return head(:forbidden) unless signed_in?
    @post=Post.new(user_id: params[:user_id])
# byebug
  end

  def create
    @post=Post.create(post_params)
    @user=@post.owner
    redirect_to user_posts_path(@user)
  end

  def show
    return head(:forbidden) unless signed_in?
    @post=Post.find_by(id: params[:id])

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def post_params
# byebug
      params.require(:post).permit(:content, :user, :user_id)
    end
end
