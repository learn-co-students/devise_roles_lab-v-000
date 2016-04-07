class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @posts = Post.none
    @posts ||= current_user.posts
    #@posts = Post.none
  end

end
