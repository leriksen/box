class Ability
  include CanCan::Ability
  
  def initialize(user=nil)
    user ||= User.new # guest user
    
    # common actions are :read, :create, :update and :destroy
    if user.is? :admin
      can :manage, :all
    elsif user.is? :manager
      # cannot destroy - though we may support an inactive flag and make that the destroy
      can [:create, :read, :update], User
      cannot :destory, :all
    elsif user.is? :staff
      can :update, User
      cannot :create, User
      cannot :destroy, :all
    elsif user.is? :customer
    else # guest
    end
  end
end
