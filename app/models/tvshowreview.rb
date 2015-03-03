class TvShowReview < ActiveRecord::Base
  belongs_to :tvshow
  # belongs_to :user
end
