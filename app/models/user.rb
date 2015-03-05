class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_secure_password

  validates_length_of :bio, :maximum => 70

  validates :username, :email, presence: true, uniqueness: true

  has_many :tv_show_reviews

  has_many :tv_shows, through: :tv_show_reviews

  has_many :active_relationships, class_name: "Follow", foreign_key: :follower_id
  has_many :passive_relationships, class_name: "Follow", foreign_key: :followee_id
  has_many :followers, through: :active_relationships, source: :follower
  has_many :followees, through: :passive_relationships, source: :followee
end
