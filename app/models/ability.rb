class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    else if user.role? :manager
      can [:create, :update] :all
    else if user.role? :worker
      can [:read] :all
    else # guest
    end
  end
end
