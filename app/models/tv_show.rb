class TvShow < ActiveRecord::Base
  has_many :tv_show_reviews
  # has_many :users, through: :tvshowreviews

end
