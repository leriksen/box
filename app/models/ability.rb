# roles mappings
class Ability
  include CanCan::Ability
  
  def initialize(user=nil)
    user ||= User.new # guest user
    
    # Note there are some protections in User model too, namely
    # a customer role cannot be combined with anything else.
    # This simplifies this table as we do not need to check if
    # create/updates try to create customer-hybrids, as User#roles=
    # simple wont write these to the database 

    # common actions are :read, :create, :update and :destroy
    if user.is? :admin
      can :manage, :all
    elsif user.is? :manager
      # a manager cannot move someone higher than manager
      cannot [:create, :read, :update], User do |u|
        u.role? :admin
      end
      # also, cannot interact with guest 
      cannot [:create, :read, :update], User do |u|
        u.role? :guest
      end
      # can CRU all others 
      can [:create, :read, :update], User do |u|
        (u.roles & %w(customer staff manager)).any?
      end
      # cannot destroy - though we may support an inactive flag and make that the destroy
      # can :manage, [Booking, Animal]
      cannot :destory, :all
    elsif user.is? :staff
      # a staff member cannot interract with higher than staff
      # also, cannot interract with guest
      can [:create, :read, :update], User do |u|
        (u.roles & %w(guest admin manager)).empty?
      end
      cannot :destroy, :all
    elsif user.is? :customer
      can [:read, :update], User, id: user.id
    else # guest
      can :create, User do |u|
        # can only update self to customer
        u.roles == ['customer']
      end
    end
  end
end
