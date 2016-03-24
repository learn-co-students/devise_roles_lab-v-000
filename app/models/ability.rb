class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil
    user.can :manage, Post, {owner_id: user.id}
    return if user.user?

    user.can :update, :destroy, Post
    return if user.vip?

    user.can :manage, Post if user.admin?
  end
end
