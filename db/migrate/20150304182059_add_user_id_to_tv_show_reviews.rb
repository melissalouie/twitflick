class AddUserIdToTvShowReviews < ActiveRecord::Migration
  def change
    add_column :tv_show_reviews, :user_id, :integer
  end
end
