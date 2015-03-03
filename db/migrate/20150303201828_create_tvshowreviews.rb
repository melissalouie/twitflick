class CreateTvshowreviews < ActiveRecord::Migration
  def change
    create_table :tv_show_reviews do |t|
      t.belongs_to :tv_show, index: true
      t.string :review
      t.integer :rating
    end
    add_foreign_key :tv_show_reviews, :tv_shows
  end
end
