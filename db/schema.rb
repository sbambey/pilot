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

ActiveRecord::Schema.define(version: 20140628033011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "airports", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flies", force: true do |t|
    t.integer  "airline_id"
    t.string   "name"
    t.string   "program_type"
    t.text     "duration"
    t.text     "post_graduation"
    t.string   "website"
    t.text     "hiring_status"
    t.decimal  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "headings", force: true do |t|
    t.integer  "fly_id"
    t.text     "title"
    t.boolean  "is_table"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunities", force: true do |t|
    t.integer  "airline_id"
    t.string   "opportunity_name"
    t.string   "program_type"
    t.text     "duration"
    t.text     "post_graduation"
    t.string   "website"
    t.text     "hiring_status"
    t.decimal  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paragraphs", force: true do |t|
    t.integer  "subheading_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subheadings", force: true do |t|
    t.integer  "heading_id"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
