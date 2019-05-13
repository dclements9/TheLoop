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

ActiveRecord::Schema.define(version: 20190513191613) do

  create_table "reviews", force: :cascade do |t|
    t.string  "track_name"
    t.integer "overall"
    t.integer "vendors"
    t.integer "child_friendly"
    t.integer "walkability"
    t.integer "crowds"
    t.string  "comments"
    t.integer "user_id"
    t.integer "track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string  "name"
    t.decimal "length"
    t.integer "type"
    t.string  "address"
    t.integer "reviews_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
