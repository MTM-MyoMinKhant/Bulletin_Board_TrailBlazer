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

ActiveRecord::Schema[7.0].define(version: 2023_08_14_081800) do
  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "status"
    t.bigint "create_user_id"
    t.bigint "updated_user_id"
    t.bigint "deleted_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["create_user_id"], name: "index_posts_on_create_user_id"
    t.index ["deleted_user_id"], name: "index_posts_on_deleted_user_id"
    t.index ["updated_user_id"], name: "index_posts_on_updated_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role"
    t.bigint "phone"
    t.string "address"
    t.string "avatar"
    t.date "dob"
    t.bigint "create_user_id"
    t.bigint "updated_user_id"
    t.bigint "deleted_user_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["create_user_id"], name: "index_users_on_create_user_id"
    t.index ["deleted_user_id"], name: "index_users_on_deleted_user_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["updated_user_id"], name: "index_users_on_updated_user_id"
  end

  add_foreign_key "posts", "users", column: "create_user_id"
  add_foreign_key "posts", "users", column: "deleted_user_id"
  add_foreign_key "posts", "users", column: "updated_user_id"
  add_foreign_key "users", "users", column: "create_user_id"
  add_foreign_key "users", "users", column: "deleted_user_id"
  add_foreign_key "users", "users", column: "updated_user_id"
end
