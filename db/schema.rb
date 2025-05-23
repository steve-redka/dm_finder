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

ActiveRecord::Schema[7.2].define(version: 2025_05_16_182009) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chat_messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_chat_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.datetime "last_message_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms_users", force: :cascade do |t|
    t.integer "chat_room_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_chat_rooms_users_on_chat_room_id"
    t.index ["user_id"], name: "index_chat_rooms_users_on_user_id"
  end

  create_table "game_applications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "game_id", null: false
    t.text "message"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_applications_on_game_id"
    t.index ["user_id"], name: "index_game_applications_on_user_id"
  end

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
    t.time "game_time"
    t.string "recurrence"
    t.date "next_game"
    t.string "platform"
    t.integer "occupied_seats"
    t.integer "gaming_system_id"
    t.text "schedule"
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

  create_table "gaming_systems", force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gaming_systems_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "gaming_system_id", null: false
    t.index ["user_id", "gaming_system_id"], name: "index_gaming_systems_users_on_user_id_and_gaming_system_id"
  end

  create_table "join_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "game_id", null: false
    t.text "message"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_join_requests_on_game_id"
    t.index ["user_id"], name: "index_join_requests_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chat_rooms_users", "chat_rooms"
  add_foreign_key "chat_rooms_users", "users"
  add_foreign_key "game_applications", "games"
  add_foreign_key "game_applications", "users"
  add_foreign_key "games", "users", column: "dm_id"
  add_foreign_key "games_users", "games"
  add_foreign_key "games_users", "users"
  add_foreign_key "join_requests", "games"
  add_foreign_key "join_requests", "users"
end
