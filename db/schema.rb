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

ActiveRecord::Schema.define(version: 20140320211955) do

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "picture"
    t.string   "category"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "businesses", ["email"], name: "index_businesses_on_email", unique: true
  add_index "businesses", ["remember_token"], name: "index_businesses_on_remember_token"

  create_table "menu_items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "business_id"
    t.decimal  "price",              precision: 12, scale: 2
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "menu_items", ["business_id", "created_at"], name: "index_menu_items_on_business_id_and_created_at"

  create_table "menus", force: true do |t|
    t.integer  "business_id"
    t.integer  "menu_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["business_id", "menu_item_id"], name: "index_menus_on_business_id_and_menu_item_id", unique: true
  add_index "menus", ["business_id"], name: "index_menus_on_business_id"
  add_index "menus", ["menu_item_id"], name: "index_menus_on_menu_item_id"

end
