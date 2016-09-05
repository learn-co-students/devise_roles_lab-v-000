class User < ActiveRecord::Base
  has_many :posts
  enum role: [:user, :vip, :admin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
