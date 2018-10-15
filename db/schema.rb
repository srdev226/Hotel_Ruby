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

ActiveRecord::Schema.define(version: 20180914024856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_engines", force: :cascade do |t|
    t.string   "type_",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buyers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "fullname",     null: false
    t.string   "shortname",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "picture_link"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "check_out_date"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
    t.datetime "confirmed_at"
    t.datetime "switched_at"
    t.integer  "price"
    t.text     "check_in_date"
    t.boolean  "purchased",            default: false
    t.string   "paid_status"
    t.string   "confirmation_number"
    t.string   "name_on_reservation"
    t.string   "paypal_email"
    t.integer  "buyer_id"
    t.datetime "seller_approved_at"
    t.string   "confirmed_by"
    t.date     "check_in"
    t.date     "check_out"
    t.string   "seller_phone"
    t.string   "seller_contact_email"
    t.integer  "hotel_id"
    t.integer  "booking_engine_id"
    t.integer  "room_type_id"
    t.string   "hotel"
    t.string   "bookingengine"
    t.string   "room_type"
  end

  add_index "listings", ["booking_engine_id"], name: "index_listings_on_booking_engine_id", using: :btree
  add_index "listings", ["hotel_id"], name: "index_listings_on_hotel_id", using: :btree
  add_index "listings", ["room_type_id"], name: "index_listings_on_room_type_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "stripe_token"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "type_",        null: false
    t.string   "description"
    t.string   "picture_link"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "publishable_key"
    t.string   "provider"
    t.string   "uid"
    t.string   "access_code"
    t.string   "phone_number"
    t.boolean  "admin",                  default: false
    t.integer  "hotel_id"
    t.integer  "purchase_intent"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["hotel_id"], name: "index_users_on_hotel_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "listings", "booking_engines"
  add_foreign_key "listings", "hotels"
  add_foreign_key "listings", "room_types"
  add_foreign_key "users", "hotels"
end
