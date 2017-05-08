class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]

  after_initialize :set_default_role #Would make much more sense to do this in the database. And apparently the mdomel too.

  def set_default_role
    self.role = :user
  end

  def show
  end

end
