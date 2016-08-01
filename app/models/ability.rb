class Ability
  include CanCan::Ability


# Posts can be created by any user
# Anyone can read any post
# Users can edit or delete Posts they own
# VIPs can edit anyone's Posts
# Admins can do anything to any post.

  def initialize(user)
    user.can :create, Post
    user.can :read, Post
 
    user.can :update, Post, {user_id: user.id}
    user.can :delete, Post, {user_id: user.id}
    return if user.user?
 
    user.can :update, Post
    return if user.vip?
 
    user.can :manage, Post if user.admin?
  end
end
