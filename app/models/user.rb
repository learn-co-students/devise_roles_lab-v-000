class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  after_initialize :set_default_role
  enum role: [:user, :vip, :admin]


  private
  def set_default_role
    self.role ||= :user
  end
end
