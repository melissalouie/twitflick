class TvShowReview < ActiveRecord::Base
  belongs_to :tv_show
  # belongs_to :user
end
