class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :confirmable, :database_authenticatable, :registerable, :rememberable, :validatable
  enum role: [:user, :vip, :admin]
  has_many :posts
  after_initialize :default_to_user

  private

  def default_to_user
    self.role = :user
  end
end
