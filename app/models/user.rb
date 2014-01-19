class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

#   attr_accessible :username, :password, :password_confirmation, :remember_me
  
  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-z]+.[a-z]+\z/,
    message: "only allows firstname.lastname, all lower-case" }
end
