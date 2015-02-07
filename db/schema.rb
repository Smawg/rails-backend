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

ActiveRecord::Schema.define(version: 20150111080000) do

  create_table "account_plans", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "organisation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: true do |t|
    t.integer  "number"
    t.string   "name"
    t.string   "description"
    t.integer  "account_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_years", force: true do |t|
    t.integer  "year"
    t.datetime "year_start"
    t.datetime "year_end"
    t.integer  "organisation_id"
    t.integer  "accountplan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organisations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voucher_rows", force: true do |t|
    t.integer "account_number"
    t.float   "debet"
    t.float   "credit"
    t.integer "voucher_id"
  end

  create_table "vouchers", force: true do |t|
    t.integer  "number"
    t.string   "description"
    t.datetime "date"
    t.integer  "business_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
