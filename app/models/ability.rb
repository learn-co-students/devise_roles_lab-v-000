class Ability
  include CanCan::Ability

  def initialize(user)
        if user.admin?
          # only admins can change things
          can :update, Post
        end
        # but anyone can read them
        can :read, Post
      end
end
