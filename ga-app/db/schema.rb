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

ActiveRecord::Schema.define(version: 20140425182926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "is_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.decimal  "price"
    t.integer  "user_id"
    t.datetime "signup_start"
    t.datetime "signup_end"
    t.datetime "event_start"
    t.datetime "event_end"
    t.boolean  "uses_paypal"
    t.boolean  "recurring_events"
    t.string   "recurring_timeframe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.boolean  "is_admin",    default: false
    t.string   "name"
    t.string   "email"
    t.string   "cohort"
    t.string   "avatar_url"
    t.string   "oauth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
