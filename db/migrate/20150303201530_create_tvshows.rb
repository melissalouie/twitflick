class CreateTvshows < ActiveRecord::Migration
  def change
    create_table :tv_shows do |t|
      t.string :title
      t.string :genre
    end
  end
end
