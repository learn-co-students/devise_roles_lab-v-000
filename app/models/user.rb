class User < ActiveRecord::Base
	has_many :posts
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  enum role: [:user, :vip, :admin]
end
