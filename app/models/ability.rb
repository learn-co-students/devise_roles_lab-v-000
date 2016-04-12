class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.admin?
        can :manage, :all
    elsif user.vip?
        can :manage, Post
    elsif user.user?
        can :manage, Post, :user_id => user.id
        can :read, Post
    else
        can :read, Post
    end

    can :read, User, :id => user.id
    
  end

end
