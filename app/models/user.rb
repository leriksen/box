class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  scope :with_role, -> (role) {where("roles_mask & ? > 0", 2**ROLES.index(role.to_s))}

  # if you ever add new roles to this array, add them to the end
  # to avoid breaking the roles_mask of existing users
  unless defined? ROLES
    ROLES = %w(guest customer staff manager admin)
  end

  # TODO - can transition from guest to anything, how to protect ?
  def roles=(new_roles)

    new_roles.select!{|r|not r.empty?} # strip blanks

    new_roles.map!{|r|r.to_s}

    return if roles.include?('customer') or 
      (roles.length >= 1 and new_roles.include?('customer'))
       # cant be a customer and something else

    roles_mask = (new_roles & ROLES).map { |r| 2**ROLES.index(r) }.sum

    self.roles_mask = roles_mask
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role?(role)
    case role.to_s
    when 'guest'
      roles.empty?
    else
      roles.include? role.to_s
    end
  end

  alias_method :is?, :role?
end
