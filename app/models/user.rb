class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :vip, :admin]
  has_many :posts

  after_initialize :assign_role
    def assign_role
      self.role ||= :user
    end

  def guest?
    persisted?
  end

end
