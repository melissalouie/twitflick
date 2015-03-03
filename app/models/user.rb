class User < ActiveRecord::Base
  has_secure_password
  validates :bio, :avatar
  validates :username, :email, presence: true, uniqueness: true
end
