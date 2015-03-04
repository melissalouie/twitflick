class RemoveTvShowIdFromGenres < ActiveRecord::Migration
  def change
    remove_column :genres, :tv_show_id, :integer
    remove_column :tv_shows, :genre, :integer
    add_column :tv_shows, :genre_id, :integer
  end
end
