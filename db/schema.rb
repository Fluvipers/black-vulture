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

ActiveRecord::Schema.define(version: 20160126181632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "facts", force: :cascade do |t|
    t.integer  "line_id"
    t.jsonb    "properties"
    t.integer  "time_unit_id"
    t.decimal  "value",        precision: 20, scale: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "key"
  end

  add_index "facts", ["line_id"], name: "index_facts_on_line_id", using: :btree
  add_index "facts", ["time_unit_id"], name: "index_facts_on_time_unit_id", using: :btree

  create_table "lines", force: :cascade do |t|
    t.string   "name"
    t.jsonb    "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_units", force: :cascade do |t|
    t.datetime "when"
    t.string   "year"
    t.string   "semester"
    t.string   "quarter"
    t.string   "bimester"
    t.string   "month"
    t.string   "month_of_year"
    t.string   "fortnight"
    t.string   "week_of_year"
    t.string   "week_of_month"
    t.string   "day"
    t.string   "day_of_week"
    t.string   "day_of_month"
    t.string   "day_of_year"
    t.string   "noon"
    t.string   "hour"
    t.string   "minute"
    t.string   "time_zone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "facts", "lines"
  add_foreign_key "facts", "time_units"
end
