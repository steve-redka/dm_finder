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

ActiveRecord::Schema[7.2].define(version: 2025_04_28_124757) do
  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "age_restriction"
    t.float "price"
    t.float "duration"
    t.integer "seats"
    t.text "experience"
    t.string "system"
    t.string "power_level"
    t.text "application_process"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dm_id"
    t.index ["dm_id"], name: "index_games_on_dm_id"
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.index ["game_id", "user_id"], name: "index_games_users_on_game_id_and_user_id", unique: true
    t.index ["game_id"], name: "index_games_users_on_game_id"
    t.index ["user_id", "game_id"], name: "index_games_users_on_user_id_and_game_id", unique: true
    t.index ["user_id"], name: "index_games_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "users", column: "dm_id"
  add_foreign_key "games_users", "games"
  add_foreign_key "games_users", "users"
end
