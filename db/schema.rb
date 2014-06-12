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

ActiveRecord::Schema.define(version: 20140420061532) do

  create_table "inspections", force: true do |t|
    t.string   "inspection_id"
    t.string   "permit_number"
    t.datetime "date"
    t.integer  "demerits"
    t.string   "grade"
    t.string   "inspection_type"
    t.string   "permit_status"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inspections", ["inspection_id"], name: "index_inspections_on_inspection_id", unique: true, using: :btree

  create_table "inspections_violations", force: true do |t|
    t.integer "inspection_id"
    t.integer "violation_id"
  end

  create_table "restaurants", force: true do |t|
    t.integer  "permit_id"
    t.string   "permit_number"
    t.string   "name"
    t.string   "address"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "city"
    t.string   "zip"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["permit_id"], name: "index_restaurants_on_permit_id", unique: true, using: :btree
  add_index "restaurants", ["permit_number"], name: "index_restaurants_on_permit_number", unique: true, using: :btree

  create_table "violations", force: true do |t|
    t.string   "code"
    t.integer  "demerits"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
