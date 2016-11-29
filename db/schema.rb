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

ActiveRecord::Schema.define(version: 20161129043854) do

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "first_choice"
    t.integer  "second_choice"
    t.integer  "third_choice"
    t.integer  "fourth_choice"
    t.integer  "fifth_choice"
    t.integer  "sixth_choice"
    t.integer  "seventh_choice"
    t.string   "username"
    t.integer  "force_matched_project_id"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.integer  "project_id"
  end

  add_index "matches", ["group_id"], name: "index_matches_on_group_id"
  add_index "matches", ["project_id"], name: "index_matches_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "settings", force: :cascade do |t|
    t.text     "spreadsheet_id"
    t.text     "group_tab"
    t.text     "group_username_col"
    t.text     "group_id_col"
    t.text     "group_preference_1"
    t.text     "group_preference_2"
    t.text     "group_preference_3"
    t.text     "group_preference_4"
    t.text     "group_preference_5"
    t.text     "group_preference_6"
    t.text     "group_preference_7"
    t.text     "project_tab"
    t.text     "project_id_col"
    t.text     "project_name_col"
    t.text     "matches_tab"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
