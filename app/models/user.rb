class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :vip, :admin]

  after_initialize :default_role

  def default_role 
    self.role ||= :user 
  end


  # def initialize(user)
  #   user.can :update, :read, :create, :delete Post, {owner_id: user.id}
  #   return if user.normal?

  #   user.can :update, :delete, :create, :read Post
  #   return if user.vip?

  #   user.can :manage, :update, :destroy Post if user.admin?
  # end







end ## class end
