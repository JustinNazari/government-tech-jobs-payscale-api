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

ActiveRecord::Schema.define(version: 20160616142038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.decimal "private_sector_coefficient"
    t.decimal "public_sector_coefficient"
    t.string  "city"
    t.string  "state"
  end

  create_table "private_sector_jobs", force: :cascade do |t|
    t.string  "title"
    t.integer "min"
    t.integer "max"
    t.integer "section_id"
  end

  create_table "public_sector_jobs", force: :cascade do |t|
    t.integer "grade"
    t.decimal "min"
    t.decimal "max"
  end

  create_table "public_sector_special_pay_jobs", force: :cascade do |t|
    t.integer "grade"
    t.decimal "min"
    t.decimal "max"
    t.decimal "supplement"
    t.integer "location_id"
    t.index ["location_id"], name: "index_public_sector_special_pay_jobs_on_location_id", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
  end

<<<<<<< HEAD
  add_foreign_key "public_sector_special_pay_jobs", "locations"
=======
  create_table "skills", force: :cascade do |t|
    t.integer "section_id"
    t.decimal "skill_coefficient"
    t.string  "name"
  end

>>>>>>> 7a5f3b053655630d79c60beeb8cc6da543f48a6b
end
