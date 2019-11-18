class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :first_name, :last_name, :password, :password_confirmation
  validates :email, presence: true, uniqueness: true

end
