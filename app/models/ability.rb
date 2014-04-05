class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :manager
      can [:create, :update], :all
    elsif user.role? :staff
      can [:read], :all
    elsif user.role? :customer
      can [:read], :all
    else # guest
    end
  end
end
