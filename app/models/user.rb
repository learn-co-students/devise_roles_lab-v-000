class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :rememberable, :validatable
  enum role: [:user, :vip, :admin]

  after_initialize :set_role, :if => :new_record?

  def set_role
    self.role ||= :user
  end

end
