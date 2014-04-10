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

ActiveRecord::Schema.define(version: 20140409151419) do

  create_table "agents", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone",      limit: 8, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agents", ["phone"], name: "index_agents_on_phone", unique: true, using: :btree

  create_table "mcq4s", force: true do |t|
    t.string   "question"
    t.string   "a"
    t.string   "b"
    t.string   "c"
    t.string   "d"
    t.integer  "survey_id"
    t.integer  "question_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer "survey_id"
    t.integer "agent_id"
    t.integer "surveyee_id"
  end

  create_table "results", force: true do |t|
    t.integer  "response_id"
    t.integer  "mcq4_id"
    t.integer  "ynq_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveyees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "age"
    t.string   "sex"
    t.integer  "phone",      limit: 8, null: false
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveyees", ["phone"], name: "index_surveyees_on_phone", unique: true, using: :btree

  create_table "surveys", force: true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "ynqs", force: true do |t|
    t.string   "question"
    t.integer  "survey_id"
    t.integer  "question_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
