# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2018_02_19_221860) do
  create_table "users", force: :cascade do |t|
    t.boolean "active"
    t.string "avatar"
    t.time "awake"
    t.text "bio"
    t.date "birthday"
    t.string "choises"
    t.string "color"
    t.datetime "created_at", precision: nil, null: false
    t.string "email"
    t.datetime "first_kiss", precision: nil
    t.integer "friends"
    t.string "fruit"
    t.string "language"
    t.integer "mood"
    t.string "music"
    t.string "name"
    t.string "password"
    t.string "pill"
    t.boolean "terms"
    t.datetime "updated_at", precision: nil, null: false
  end
end
