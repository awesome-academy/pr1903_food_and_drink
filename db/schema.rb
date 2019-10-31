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

ActiveRecord::Schema.define(version: 2019_10_31_122516) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "price"
    t.integer "consumable_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["consumable_id"], name: "index_cart_items_on_consumable_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "price_total"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_consumables", force: :cascade do |t|
    t.integer "consumable_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_consumables_on_category_id"
    t.index ["consumable_id"], name: "index_category_consumables_on_consumable_id"
  end

  create_table "consumables", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.text "description"
    t.integer "price"
    t.integer "quantity", default: 0
    t.float "rate_average"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "consumable_id", null: false
    t.integer "user_id", null: false
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consumable_id"], name: "index_ratings_on_consumable_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "picture"
    t.string "description"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "age"
    t.string "avatar"
    t.string "phone_number"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "consumables"
  add_foreign_key "carts", "users"
  add_foreign_key "category_consumables", "categories"
  add_foreign_key "category_consumables", "consumables"
  add_foreign_key "ratings", "consumables"
  add_foreign_key "ratings", "users"
  add_foreign_key "suggestions", "users"
  add_foreign_key "user_profiles", "users"
end
