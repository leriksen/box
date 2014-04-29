class Ability
  include CanCan::Ability
  
  def initialize(user=nil)
    user ||= User.new # guest user
    
    # common actions are :read, :create, :update and :destroy
    if user.is? :admin
      can :manage, :all
    elsif user.is? :manager
      # a manager cannot move someone higher than manager
      can [:create, :read, :update], User do |user|
        not (user.roles & %w(customer staff manager)).empty?
      end
      # cannot destroy - though we may support an inactive flag and make that the destroy
      # can :manage, [Booking, Animal]
      cannot :destory, :all
    elsif user.is? :staff
      # a staff member cannot move someone higher than staff
      can [:create, :read, :update], User do |user|
        not (user.roles & %w(customer staff)).empty?
       end
      # can :manage, [Booking, Animal]
      cannot :destroy, :all
    elsif user.is? :customer
      can [:read, :update], User, id: user.id
      # can [:create, :read, :update], [Booking, Animal]
    else # guest
      # role_map == 2 means is a customer record
      can :create, User do |user|
        user.roles == ['customer']
      end
    end
  end
end
