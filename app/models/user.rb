class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts

  devise :database_authenticatable, :registerable, :rememberable, :confirmable,
         :validatable, :recoverable


  enum role: [:user, :vip, :admin]

  after_initialize :set_default_role

  private

    def set_default_role
      self.role ||= :user
    end
end
