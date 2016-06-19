class PostsController < ApplicationController
  load_resource only: [:update]

  def update
    authorize! :update, @post

    if @post.update(params.require(:post).permit(:content))
      redirect_to '/'
    end

    rescue CanCan::AccessDenied
      redirect_to '/'
  end
end
