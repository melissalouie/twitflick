class CreateTvshowreviews < ActiveRecord::Migration
  def change
    create_table :tvshowreviews do |t|
      t.belongs_to :tvshow, index: true
      t.string :review
      t.integer :rating
    end
    add_foreign_key :tvshowreviews, :tvshows
  end
end
