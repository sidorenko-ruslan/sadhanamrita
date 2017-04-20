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

ActiveRecord::Schema.define(version: 20170420072000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "table_columns", force: :cascade do |t|
    t.string   "title",                  null: false
    t.integer  "type",                   null: false
    t.integer  "order",      default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_table_column_values", force: :cascade do |t|
    t.integer "user_id",                      null: false
    t.integer "table_column_id",              null: false
    t.integer "year",                         null: false
    t.integer "month",                        null: false
    t.json    "days_values",     default: {}, null: false
  end

  create_table "user_table_columns", force: :cascade do |t|
    t.integer "user_id",                         null: false
    t.integer "table_column_id",                 null: false
    t.boolean "is_active",       default: true,  null: false
    t.boolean "is_primary",      default: false, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",                  default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "user_table_column_values", "table_columns"
  add_foreign_key "user_table_column_values", "users"
  add_foreign_key "user_table_columns", "table_columns"
  add_foreign_key "user_table_columns", "users"
end
