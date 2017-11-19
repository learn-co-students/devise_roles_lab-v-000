class Post < ActiveRecord::Base
  belongs_to :user
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

end
