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

ActiveRecord::Schema[7.0].define(version: 2022_07_07_143349) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentor_topics", force: :cascade do |t|
    t.string "rating"
    t.bigint "mentor_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_mentor_topics_on_mentor_id"
    t.index ["topic_id"], name: "index_mentor_topics_on_topic_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "photo"
    t.string "name"
    t.string "bio"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mentors_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "mentor_topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_topic_id"], name: "index_reservations_on_mentor_topic_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "label"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "role", default: "user"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mentor_topics", "mentors"
  add_foreign_key "mentor_topics", "topics"
  add_foreign_key "mentors", "users"
  add_foreign_key "reservations", "mentor_topics"
  add_foreign_key "reservations", "users"
end
