class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]


  private

    def set_post
      @post = Post.find(params[:id])
    end

end