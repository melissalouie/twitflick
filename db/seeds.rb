# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# TvShow.create(title: 'Game of Thrones', genre: 'Drama')
# TvShow.create(title: 'Mindy Project', genre: 'Comedy')
# TvShowReview.create(tv_show_id: 1, review: 'Really good show.', rating: 5)

[
  "Drama",
  "Comedy",
  "Sports",
  "SciFi",
  "Nature/Animals",
  "Reality",
  "News",
  "Food",
  "Kids"
].each do |name|
  Genre.create!(name: name)
end
