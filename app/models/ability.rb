class Ability
  include CanCan::Ability

  def initialize(user)
    user.can :read, Post
    user.can :update, Post, {user_id: user.id}
    user.can :destroy, Post, {user_id: user.id}
    return if user.user?

    user.can :update, Post
    user.can :destroy, Post
    return if user.vip?

    user.can :manage, Post if user.admin?
  end
end
