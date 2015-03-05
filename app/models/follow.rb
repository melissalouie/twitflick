class Follow < ActiveRecord::Base
  validates_presence_of :follower_id, :followee_id

  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"
end
