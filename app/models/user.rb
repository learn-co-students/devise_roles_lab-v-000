class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #:confirmable, :recoverable, :trackable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :posts

  enum role: [:admin, :vip, :user]

  after_initialize :set_default_user_role

  def set_default_user_role
    self.role ||= :user
  end
end
