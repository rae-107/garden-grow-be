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

ActiveRecord::Schema.define(version: 2023_04_01_034801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grow_zone"
    t.string "img"
    t.string "linked_in"
    t.string "github"
    t.string "email"
    t.string "about_me"
  end

  create_table "vegetable_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "vegetable_id"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vegetable_users_on_user_id"
    t.index ["vegetable_id"], name: "index_vegetable_users_on_vegetable_id"
  end

  create_table "vegetable_zones", force: :cascade do |t|
    t.bigint "vegetable_id"
    t.string "zone"
    t.string "plant_seeds_indoors_start"
    t.string "plant_seeds_indoors_end"
    t.string "plant_seedlings_start"
    t.string "plant_seedlings_end"
    t.string "plant_seeds_outdoors_start"
    t.string "plant_seeds_outdoors_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vegetable_id"], name: "index_vegetable_zones_on_vegetable_id"
  end

  create_table "vegetables", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "sun"
    t.string "water"
    t.string "row_spacing"
    t.string "seed_spacing"
    t.string "growing_duration"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "vegetable_users", "users"
  add_foreign_key "vegetable_users", "vegetables"
  add_foreign_key "vegetable_zones", "vegetables"
end
