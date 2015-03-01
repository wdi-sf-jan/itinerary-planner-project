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

ActiveRecord::Schema.define(version: 20150301003527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id", using: :btree

  create_table "itineraries_users", force: true do |t|
    t.integer  "itinerary_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itineraries_users", ["itinerary_id"], name: "index_itineraries_users_on_itinerary_id", using: :btree
  add_index "itineraries_users", ["user_id"], name: "index_itineraries_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_waypoints", force: true do |t|
    t.integer  "user_id"
    t.integer  "waypoint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_waypoints", ["user_id"], name: "index_users_waypoints_on_user_id", using: :btree
  add_index "users_waypoints", ["waypoint_id"], name: "index_users_waypoints_on_waypoint_id", using: :btree

  create_table "waypoints", force: true do |t|
    t.string   "name"
    t.json     "location"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "itinerary_id"
  end

  add_index "waypoints", ["itinerary_id"], name: "index_waypoints_on_itinerary_id", using: :btree

end
