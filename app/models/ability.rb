class Ability
  include CanCan::Ability

  def initialize(user)
		user.can :read, Post
		return if user.guest?
		
		user.can :create, Post
		return if user.user?
		
		user.can :update, Post
		return if user.vip?
		
		user.can :manage, Post if user.admin?
  end
end
