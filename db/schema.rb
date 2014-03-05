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

ActiveRecord::Schema.define(version: 20140302212139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

end
