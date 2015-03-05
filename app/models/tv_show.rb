class TvShow < ActiveRecord::Base
  has_many :tv_show_reviews, dependent: :destroy
  has_many :users, through: :tvshowreviews
  belongs_to :genre
  validates :title, presence: true, uniqueness: true
  validates :genre_id, presence: true
end
