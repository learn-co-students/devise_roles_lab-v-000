class Post < ActiveRecord::Base
  belongs_to :user

  def user=(user)
  end

end
