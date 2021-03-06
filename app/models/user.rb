class User < ActiveRecord::Base
  has_many :links
  has_secure_password
  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
