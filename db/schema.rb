# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150304182059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tv_show_reviews", force: :cascade do |t|
    t.integer "tv_show_id"
    t.string  "review"
    t.integer "rating"
    t.integer "user_id"
  end

  add_index "tv_show_reviews", ["tv_show_id"], name: "index_tv_show_reviews_on_tv_show_id", using: :btree

  create_table "tv_shows", force: :cascade do |t|
    t.string "title"
    t.string "genre"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "email"
    t.string "avatar"
  end

  add_foreign_key "tv_show_reviews", "tv_shows"
end
