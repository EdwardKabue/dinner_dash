# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150810184950) do

  create_table "addresses", force: true do |t|
    t.integer  "street_number"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["title"], name: "index_categories_on_title", unique: true

  create_table "item_categories", id: false, force: true do |t|
    t.integer "item_id"
    t.integer "category_id"
  end

  add_index "item_categories", ["item_id", "category_id"], name: "index_item_categories_on_item_id_and_category_id"

  create_table "items", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "retired"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "items", ["title"], name: "index_items_on_title", unique: true

  create_table "line_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "quantity",           default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "line_itemable_id"
    t.string   "line_itemable_type"
  end

  create_table "orders", force: true do |t|
    t.boolean  "pickup_or_delivery"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "ordered"
    t.boolean  "cancelled"
    t.boolean  "completed"
    t.boolean  "paid"
    t.datetime "completed_at"
    t.datetime "cancelled_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "display_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["full_name", "display_name"], name: "index_users_on_full_name_and_display_name", unique: true

end
