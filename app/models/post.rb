class Post < ActiveRecord::Base

  belongs_to :user

  attr_reader :username

  def username=(username)
    user = User.find_by(email: username)
    user.posts << self
  end

end
