
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post!, only: [:edit, :show, :update]
  before_action :authorize_user!, only: [:edit, :update]

  def show
  end

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @post.update!(content: params[:post][:content])

    redirect_to post_path, id: @post.id
  end

  def destroy
    return head(:forbidden) unless current_user.admin? || current_user.vip? || current_user.try(:id) == @post.user.id
    @post.destroy
  end

  private

  def authorize_user!
    raise "Unauthorized!" unless current_user

    unless current_user == @post.user || current_user.vip? || current_user.admin?
      redirect_to post_path(id: @post.id), :alert => "Access denied."
    end
  end

    def post_params
      params.require(:post).permit(:user_id, :content)
    end

    def find_post!
      @post = Post.find(params[:id])
    end
end
