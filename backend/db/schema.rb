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

ActiveRecord::Schema.define(version: 2020_11_09_091042) do

  create_table "folder_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "folder_id", null: false
    t.bigint "transaction_id", null: false
    t.integer "operation_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["folder_id"], name: "index_folder_logs_on_folder_id"
    t.index ["transaction_id"], name: "index_folder_logs_on_transaction_id"
    t.index ["user_id"], name: "index_folder_logs_on_user_id"
  end

  create_table "folders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "image_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "image_id", null: false
    t.bigint "transaction_id", null: false
    t.integer "operation_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_image_logs_on_image_id"
    t.index ["transaction_id"], name: "index_image_logs_on_transaction_id"
    t.index ["user_id"], name: "index_image_logs_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "folder_id", null: false
    t.string "title"
    t.string "extension"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["folder_id"], name: "index_images_on_folder_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "invitations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "folder_id", null: false
    t.bigint "sender_id"
    t.bigint "recipent_id"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["folder_id"], name: "index_invitations_on_folder_id"
    t.index ["recipent_id"], name: "index_invitations_on_recipent_id"
    t.index ["sender_id"], name: "index_invitations_on_sender_id"
  end

  create_table "transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "login_time"
    t.datetime "logout_time"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.boolean "deactivate"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "folder_logs", "folders"
  add_foreign_key "folder_logs", "transactions"
  add_foreign_key "folder_logs", "users"
  add_foreign_key "folders", "users"
  add_foreign_key "image_logs", "images"
  add_foreign_key "image_logs", "transactions"
  add_foreign_key "image_logs", "users"
  add_foreign_key "images", "folders"
  add_foreign_key "images", "users"
  add_foreign_key "invitations", "folders"
  add_foreign_key "transactions", "users"
end
