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

ActiveRecord::Schema.define(version: 20180516091116) do

  create_table "attends", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "rest_start_at"
    t.datetime "rest_end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attends_on_user_id"
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
    t.integer "management_id"
    t.integer "user_id"
    t.date "trial_period_start_on"
    t.date "trial_period_end_on"
    t.integer "work_start"
    t.integer "break_in"
    t.integer "break_out"
    t.integer "work_out"
    t.string "holiday"
    t.string "allowance"
    t.string "allowance_contents"
    t.date "closing_on"
    t.date "payment_on"
    t.string "desuction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
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
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
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
    t.integer "management_id"
    t.integer "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["management_id"], name: "index_users_on_management_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["worker_id"], name: "index_users_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
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
