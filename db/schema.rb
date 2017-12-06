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

ActiveRecord::Schema.define(version: 20171024162753) do

  create_table "time_availabilitys", force: :cascade do |t|
    t.string   "day"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "time_availabilityable_id"
    t.string   "time_availabilityable_type"
  end

  create_table "tutees", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "year"
    t.string   "phone_number"
    t.string   "major"
    t.string   "requested_class"
    t.integer  "sid"
    t.boolean  "in_dsp"
    t.integer  "tutor_id"
    t.string   "last_name"
    t.integer  "semesters_at_cal"
    t.string   "first_name"
    t.string   "grade"
  end

  add_index "tutees", ["email"], name: "index_tutees_on_email", unique: true
  add_index "tutees", ["reset_password_token"], name: "index_tutees_on_reset_password_token", unique: true

  create_table "tutors", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "year"
    t.string   "phone_number"
    t.string   "major"
    t.text     "bio"
    t.integer  "sid"
    t.string   "tutor_cohort"
    t.string   "last_name"
  end

  add_index "tutors", ["email"], name: "index_tutors_on_email", unique: true
  add_index "tutors", ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true

end
