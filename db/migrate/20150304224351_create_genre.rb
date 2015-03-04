class CreateGenre < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.belongs_to :tv_show, index: true
    end
    add_foreign_key :genres, :tv_shows
  end
end
