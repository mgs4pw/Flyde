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

ActiveRecord::Schema.define(version: 20141207223804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: true do |t|
    t.string "name"
  end

  create_table "experiences", force: true do |t|
    t.integer  "user_id"
    t.string   "experience"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interviews", force: true do |t|
    t.integer  "company_id"
    t.integer  "student_id"
    t.integer  "position_id"
    t.datetime "sent_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.datetime "interview_datetime"
    t.integer  "matching_score"
  end

  create_table "matched_students", force: true do |t|
    t.integer  "company_id"
    t.integer  "student_id"
    t.integer  "position_id"
    t.integer  "matching_score"
    t.integer  "display_order"
    t.string   "interview_sent"
    t.datetime "sent_date"
  end

  create_table "positions", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_1"
    t.integer  "importance_1"
    t.integer  "skill_2"
    t.integer  "importance_2"
    t.integer  "skill_3"
    t.integer  "importance_3"
  end

  create_table "provinces", force: true do |t|
    t.integer "country_id"
    t.string  "name"
  end

  create_table "skill_lists", force: true do |t|
    t.string "name"
  end

  create_table "skills", force: true do |t|
    t.integer  "user_id"
    t.string   "skill"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_tests", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_list_id"
    t.float    "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_fields", force: true do |t|
    t.string "name"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.integer  "country_id"
    t.integer  "province_id"
    t.string   "phone_number"
    t.string   "user_type"
    t.string   "academic_status"
    t.string   "study_field"
    t.string   "school"
    t.string   "major"
    t.string   "position"
    t.string   "company_name"
    t.string   "website"
    t.text     "description"
    t.integer  "birth_year"
    t.integer  "study_field_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
