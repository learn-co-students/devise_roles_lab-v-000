class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  belongs_to :role
  after_initialize :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  enum role: [:user, :vip, :admin]

  def guest?
    persisted?
  end

 private
  def set_default_role
    self.role = :user
  end
end

class NilClass
  def guest?
    true
  end
end
