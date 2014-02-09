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
    ROLES = %w(admin manager worker) 
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role?(role)
    roles.include? role.to_s
  end
end
