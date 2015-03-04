class TvShow < ActiveRecord::Base
  has_many :tv_show_reviews, dependent: :destroy
  has_many :users, through: :tvshowreviews

end
