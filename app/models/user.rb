class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_secure_password
  validates_length_of :bio, :maximum => 70
  validates :username, :email, presence: true, uniqueness: true
  has_many :tv_show_reviews
  has_many :tv_shows, through: :tv_show_reviews
end
