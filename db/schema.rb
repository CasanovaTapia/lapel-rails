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

ActiveRecord::Schema.define(version: 20150721002453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointment_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", force: true do |t|
    t.datetime "datetime"
    t.string   "location"
    t.string   "role"
    t.string   "notes"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "appointment_status_id", default: 1
  end

  add_index "appointments", ["appointment_status_id"], name: "index_appointments_on_appointment_status_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.decimal  "price",            precision: 8, scale: 2
    t.decimal  "cost",             precision: 8, scale: 2
    t.string   "brand"
    t.string   "desc"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_category_id",                         default: 1
  end

  add_index "items", ["item_category_id"], name: "index_items_on_item_category_id", using: :btree
  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree

  create_table "order_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.integer  "quantity",                           default: 1
    t.decimal  "total",      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.string   "delivery"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_status_id", default: 1
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "role"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "neck"
    t.float    "chest"
    t.float    "sleeve"
    t.float    "length"
    t.float    "waist"
    t.float    "inseam"
    t.float    "shoe"
    t.float    "suit"
    t.float    "shirt"
    t.float    "pant"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
