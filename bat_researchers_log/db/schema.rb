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

ActiveRecord::Schema.define(version: 2021_08_12_190222) do

  create_table "bats", force: :cascade do |t|
    t.string "identification"
    t.string "nickname"
    t.string "species"
    t.datetime "date_found"
    t.string "location"
    t.datetime "date_last_seen"
    t.integer "weight"
    t.integer "age"
    t.string "sex"
    t.integer "wing_span"
    t.integer "colony_size"
    t.string "conservation_status"
    t.boolean "white_nose_syndrome"
    t.string "notes"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "organization"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
