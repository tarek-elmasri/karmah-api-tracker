# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_16_112733) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_accounts_on_area_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_accounts", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "account_id", null: false
    t.text "objective", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_plan_accounts_on_account_id"
    t.index ["plan_id"], name: "index_plan_accounts_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_plans_on_area_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "user_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_user_accounts_on_account_id"
    t.index ["user_id", "account_id"], name: "index_user_accounts_on_user_id_and_account_id", unique: true
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "fullname", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
  end

  add_foreign_key "accounts", "areas"
  add_foreign_key "plan_accounts", "accounts"
  add_foreign_key "plan_accounts", "plans"
  add_foreign_key "plans", "areas"
  add_foreign_key "plans", "users"
  add_foreign_key "user_accounts", "accounts"
  add_foreign_key "user_accounts", "users"
end
