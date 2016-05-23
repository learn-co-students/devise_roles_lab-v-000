class Ability
  include CanCan::ability

  def initialize(user)
    user.can :update, Post, {owner_id: user.id}
    return if user.user?

    user.can :update, Post
    return if user.vip?

    user.can :manage, Post
    return if user.admin?
  end
end