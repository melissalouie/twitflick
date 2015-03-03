class TvShow < ActiveRecord::Base
  has_many :tvshowreviews
  # has_many :users, through: :tvshowreviews

end
