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

ActiveRecord::Schema.define(version: 2020_01_07_124648) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "price"
    t.integer "consumable_id", null: false
    t.integer "quantity"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "unit_price", precision: 12, scale: 3
    t.decimal "total_price", precision: 12, scale: 3
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["consumable_id"], name: "index_cart_items_on_consumable_id"
    t.index ["discarded_at"], name: "index_cart_items_on_discarded_at"
  end

  create_table "cart_statuses", force: :cascade do |t|
    t.string "name"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "price_total"
    t.integer "status", default: 0
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "subtotal", precision: 12, scale: 3
    t.decimal "tax", precision: 12, scale: 3
    t.decimal "shipping", precision: 12, scale: 3
    t.decimal "total", precision: 12, scale: 3
    t.integer "cart_status_id"
    t.index ["cart_status_id"], name: "index_carts_on_cart_status_id"
    t.index ["discarded_at"], name: "index_carts_on_discarded_at"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_consumables", force: :cascade do |t|
    t.integer "consumable_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_consumables_on_category_id"
    t.index ["consumable_id"], name: "index_category_consumables_on_consumable_id"
  end

  create_table "consumables", force: :cascade do |t|
    t.string "name"
    t.string "pictures"
    t.text "description"
    t.integer "price"
    t.integer "quantity", default: 0
    t.float "rate_average"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_consumables_on_discarded_at"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "consumable_id", null: false
    t.integer "user_id", null: false
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumable_id"], name: "index_ratings_on_consumable_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "picture"
    t.string "description"
    t.string "text"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_suggestions_on_discarded_at"
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "age"
    t.string "avatar"
    t.string "phone_number"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email"
  end

end
