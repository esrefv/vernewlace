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

ActiveRecord::Schema.define(version: 20170310090555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "place_id"
    t.integer  "customer_id"
    t.index ["customer_id"], name: "index_comments_on_customer_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_customers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "owners", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_owners_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true, using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "contact_mail"
    t.date     "established_at"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "category_id"
    t.integer  "owner_id"
    t.string   "qr_code"
    t.index ["owner_id"], name: "index_places_on_owner_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "date"
    t.integer  "number_of_people"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "customer_id"
    t.integer  "place_id"
    t.index ["customer_id"], name: "index_reservations_on_customer_id", using: :btree
    t.index ["place_id"], name: "index_reservations_on_place_id", using: :btree
  end

  create_table "social_profiles", force: :cascade do |t|
    t.integer  "place_id"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "foursquare"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_social_profiles_on_place_id", using: :btree
  end

  add_foreign_key "comments", "customers"
  add_foreign_key "comments", "places"
  add_foreign_key "places", "categories"
  add_foreign_key "places", "owners"
  add_foreign_key "reservations", "customers"
  add_foreign_key "reservations", "places"
  add_foreign_key "social_profiles", "places"
end
