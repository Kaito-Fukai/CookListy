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

ActiveRecord::Schema.define(version: 20180608042158) do

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "helpers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_recipes", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "ingredient_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "name_kana", limit: 191, null: false
    t.integer "unit_id"
    t.string "category", limit: 191, null: false
    t.string "name_with_unit", limit: 191
    t.string "specific_gravity"
    t.string "unit_in_lists"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "basic_unit_flag", default: false
    t.index ["category"], name: "index_ingredients_on_category"
    t.index ["name"], name: "index_ingredients_on_name"
    t.index ["name_kana"], name: "index_ingredients_on_name_kana"
    t.index ["name_with_unit"], name: "index_ingredients_on_name_with_unit"
  end

  create_table "recently_cooked_recipes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_tags", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "recipe_name", null: false
    t.text "memo"
    t.text "image_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "administrator_id"
    t.index ["recipe_name"], name: "index_recipes_on_recipe_name"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "ingredient_id"
    t.integer "quantity"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stuff_name"
    t.string "memo"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.text "steps_expression", null: false
    t.integer "steps_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_lists", force: :cascade do |t|
    t.integer "ingredient_id"
    t.string "ingredient_free_name"
    t.string "quantity"
    t.datetime "limit"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stock_image_id"
    t.string "text"
  end

  create_table "tag_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "word", null: false
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tags_on_category_id"
    t.index ["word"], name: "index_tags_on_word"
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_name"
    t.integer "cc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prepositive"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name", limit: 191, default: "", null: false
    t.string "first_name", limit: 191, default: "", null: false
    t.string "last_name_kana", limit: 191, default: "", null: false
    t.string "first_name_kana", limit: 191, default: "", null: false
    t.boolean "retire_flag", default: false, null: false
    t.string "helper_name_1"
    t.string "helper_address_1"
    t.string "helper_name_2"
    t.string "helper_address_2"
    t.string "helper_name_3"
    t.string "helper_address_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["first_name_kana"], name: "index_users_on_first_name_kana"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["last_name_kana"], name: "index_users_on_last_name_kana"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
