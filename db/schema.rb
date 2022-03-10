# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_10_084256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "borrows", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "users_id", null: false
    t.bigint "rackets_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["rackets_id"], name: "index_borrows_on_rackets_id"
    t.index ["users_id"], name: "index_borrows_on_users_id"
  end

  create_table "rackets", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "grip_size"
    t.integer "weight"
    t.integer "head_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "borrows", "rackets", column: "rackets_id"
  add_foreign_key "borrows", "users", column: "users_id"
end
