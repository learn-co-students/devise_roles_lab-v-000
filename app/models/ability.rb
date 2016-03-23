class Ability
  include CanCan::Ability

  def initialize(user)

    # Guests can only read posts
    can :read, Post

    # Users can do all CRUD tasks with their own posts
    can :manage, Post do |post|
        post.user == user
    end

    can :read, User do |user_profile|
      user_profile == user
    end

    return if user.user?

    # Vips can CRUD all posts
    can :manage, Post
    return if user.vip?

    # Admins can CRUD all posts and users
    cannot :read, User unless user.admin?
    can :manage, User

  end
end
