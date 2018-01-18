class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :vip, :admin]
  # The default role was set via the User model's migration. 
  has_many :posts



end
