class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.is? :admin
      can :manage, :all
    elsif user.is? :manager
      # cannot destroy - though we may support an inactive flag and make that the destroy
      can [:create, :update], :all
    elsif user.is? :staff
      can :update, User
    elsif user.is? :customer
    else # guest
    end
  end
end
