class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  enum role: [:user, :vip, :admin]

  has_many :posts
end
