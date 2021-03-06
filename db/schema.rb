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

ActiveRecord::Schema.define(version: 20150920133659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clips", force: true do |t|
    t.integer  "user_id"
    t.integer  "episode_id"
    t.decimal  "start_time"
    t.decimal  "duration"
    t.text     "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message"
    t.text     "video_url"
  end

  add_index "clips", ["episode_id"], name: "index_clips_on_episode_id", using: :btree
  add_index "clips", ["user_id"], name: "index_clips_on_user_id", using: :btree

  create_table "episodes", force: true do |t|
    t.integer  "show_id"
    t.text     "name"
    t.text     "description"
    t.text     "image_url"
    t.text     "audio_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "show_url"
    t.text     "episode_url"
  end

  add_index "episodes", ["show_id"], name: "index_episodes_on_show_id", using: :btree

  create_table "shows", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.text     "distributor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.text     "name"
    t.text     "email"
    t.text     "twitter_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
