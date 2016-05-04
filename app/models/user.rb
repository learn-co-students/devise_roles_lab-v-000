class User < ActiveRecord::Base
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role

  def set_default_role
    self.role ||= :user
  end
end
