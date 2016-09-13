class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  after_initialize :set_default_role
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enum role: [:admin, :vip, :user]


  private

  def set_default_role
    self.role ||= :user
  end

end
