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

ActiveRecord::Schema.define(version: 2018_02_19_221860) do

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "avatar"
    t.text "bio"
    t.date "birthday"
    t.string "color"
    t.string "fruit"
    t.string "music"
    t.string "pill"
    t.string "choises"
    t.string "language"
    t.integer "friends"
    t.integer "mood"
    t.time "awake"
    t.datetime "first_kiss"
    t.boolean "active"
    t.boolean "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
