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

ActiveRecord::Schema.define(version: 20150403155449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_illustration_inners", force: true do |t|
    t.integer  "show_index"
    t.integer  "art_illustration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "art_illustration_inners", ["art_illustration_id"], name: "index_art_illustration_inners_on_art_illustration_id", using: :btree

  create_table "art_illustrations", force: true do |t|
    t.string   "name"
    t.integer  "show_index"
    t.string   "back_color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "art_letterings", force: true do |t|
    t.string   "name"
    t.integer  "show_index"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "art_logos", force: true do |t|
    t.string   "name"
    t.integer  "show_index"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "illustrations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "figure_file_name"
    t.string   "figure_content_type"
    t.integer  "figure_file_size"
    t.datetime "figure_updated_at"
  end

  create_table "letterings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "figure_file_name"
    t.string   "figure_content_type"
    t.integer  "figure_file_size"
    t.datetime "figure_updated_at"
  end

  create_table "logos", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "figure_file_name"
    t.string   "figure_content_type"
    t.integer  "figure_file_size"
    t.datetime "figure_updated_at"
  end

end
