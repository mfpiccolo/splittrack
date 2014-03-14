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

ActiveRecord::Schema.define(version: 20140314074149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.integer  "collector_id"
    t.integer  "payer_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "amount_cents"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payer_email"
    t.boolean  "approved",     default: false
  end

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "is_all_day"
    t.date     "from_date"
    t.time     "from_time"
    t.date     "to_date"
    t.time     "to_time"
    t.string   "repeats"
    t.integer  "repeats_every_n_days"
    t.integer  "repeats_every_n_weeks"
    t.integer  "repeats_weekly_each_days_of_the_week_mask"
    t.integer  "repeats_every_n_months"
    t.string   "repeats_monthly"
    t.integer  "repeats_monthly_each_days_of_the_month_mask"
    t.integer  "repeats_monthly_on_ordinals_mask"
    t.integer  "repeats_monthly_on_days_of_the_week_mask"
    t.integer  "repeats_every_n_years"
    t.integer  "repeats_yearly_each_months_of_the_year_mask"
    t.boolean  "repeats_yearly_on"
    t.integer  "repeats_yearly_on_ordinals_mask"
    t.integer  "repeats_yearly_on_days_of_the_week_mask"
    t.string   "repeat_ends"
    t.date     "repeat_ends_on"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "calendar_id"
  end

  create_table "split_payments", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "total_cents"
    t.integer  "paid_cents"
    t.integer  "cash_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "venmo_id"
    t.text     "about"
    t.string   "display_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_picture_url"
    t.string   "username"
    t.integer  "balance_cents"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
