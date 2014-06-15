# all users - guest, customer, admins, modelled here
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  has_paper_trail

  scope :with_role, -> (role) {where("roles_mask & ? > 0", 2**ROLES.index(role.to_s))}

  # if you ever add new roles to this array, add them to the end
  # to avoid breaking the roles_mask of existing users
  ROLES = %w(guest customer staff manager admin)

  def roles=(new_roles)
    new_roles.select!{|r|not r.empty?} # strip blanks

    new_roles.map!{|r|r.to_s}

    $stderr.puts "#{Time.now} - #{__method__} - new_roles == #{new_roles.inspect}"
    # cant be a customer and something else
    if roles.include?('customer') or 
      (roles.length >= 1 and new_roles.include?('customer'))
      $stderr.puts "#{Time.now} - #{__method__} - attempt to add a role to customer"
      return 
    end

    roles_mask = (new_roles & ROLES).map { |r| 2**ROLES.index(r) }.sum

    self.roles_mask = roles_mask

    self
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
