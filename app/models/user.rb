class User < ActiveRecord::Base
  has_many :posts
  devise :database_authenticatable, :registerable,  :validatable


  after_initialize :init

  enum :role=> [:user, :vip, :admin]

    def init
      self.role  ||= 0          #will set the default value only if it's nil
    end
    # is equivalent to
    # a || a = b

end
