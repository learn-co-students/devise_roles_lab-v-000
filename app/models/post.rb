require 'pry'
class Post < ActiveRecord::Base
  belongs_to :user

  def update(post_params)
    self.content = post_params[:content]
  end
end