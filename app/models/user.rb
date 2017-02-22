class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]

  after_initialize :user_role_by_default, :if => :new_record?
  has_many :posts

  private

    def user_role_by_default
    	self.role ||= :user
    end

end
