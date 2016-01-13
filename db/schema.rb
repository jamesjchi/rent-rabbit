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

ActiveRecord::Schema.define(version: 20160112232851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.integer  "price_day"
    t.integer  "price_week"
    t.string   "start_date"
    t.string   "end_date"
    t.boolean  "rented"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "review"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "reviewer_id"
  end

  create_table "reviews_users", force: :cascade do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews_users", ["review_id"], name: "index_reviews_users_on_review_id", using: :btree
  add_index "reviews_users", ["user_id"], name: "index_reviews_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "image"
    t.string   "location"
    t.date     "date_created"
    t.float    "avg_rating"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "pid"
    t.string   "provider"
    t.string   "token"
  end

  add_foreign_key "items", "users"
  add_foreign_key "reviews_users", "reviews"
  add_foreign_key "reviews_users", "users"
end
