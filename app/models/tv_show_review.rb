class TvShowReview < ActiveRecord::Base
  belongs_to :tv_show
  belongs_to :user
  validates :review, :rating, presence: true
  validate :rating_less_than_five

  def rating_less_than_five
    if rating == nil || rating > 5 || rating < 1
      errors.add(:ratings, "are from one to five stars")
    end
  end
end
