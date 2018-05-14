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

ActiveRecord::Schema.define(version: 20180421162018) do

  create_table "companies", force: :cascade do |t|
    t.string "company"
    t.string "company_short"
    t.string "first_name"
    t.string "last_name"
    t.string "first_kana"
    t.string "last_kana"
    t.string "tel_1"
    t.string "tel_2"
    t.string "fax"
    t.string "e_mail"
    t.string "trader"
    t.string "postnumber"
    t.string "address"
    t.string "capital"
    t.string "labor_number"
    t.string "employment_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managements", force: :cascade do |t|
    t.string "company"
    t.string "company_short"
    t.string "first_name"
    t.string "last_name"
    t.string "first_kana"
    t.string "last_kana"
    t.string "tel"
    t.string "fax"
    t.string "e_mail"
    t.string "postnumber"
    t.string "address"
    t.string "capital"
    t.string "labor_number"
    t.string "employment_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "try"
    t.string "work_start"
    t.string "break_in"
    t.string "break_out"
    t.string "work_out"
    t.string "holiday"
    t.string "allowance"
    t.string "allowance_contents"
    t.string "closing_date"
    t.string "payment_date"
    t.string "desuction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.string "company"
    t.string "first_name"
    t.string "last_name"
    t.string "tel"
    t.string "e_mail"
    t.string "post_number"
    t.string "address"
    t.string "birthday"
    t.string "classification"
    t.string "authority"
    t.string "hire_date"
    t.string "departure_date"
    t.string "affiliation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worlers", force: :cascade do |t|
    t.string "company"
    t.string "first_name"
    t.string "last_name"
    t.string "tel"
    t.string "e_mail"
    t.string "post_number"
    t.string "address"
    t.string "birthday"
    t.string "classification"
    t.string "authority"
    t.string "hire_date"
    t.string "departure_date"
    t.string "affiliation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
