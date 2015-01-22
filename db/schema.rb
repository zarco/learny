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

ActiveRecord::Schema.define(version: 20150118214811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true, using: :btree
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree

  create_table "calendars", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
    t.boolean  "is_default", default: false, null: false
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "workshop_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar"
    t.string   "occupation"
    t.text     "profile"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "linkedin_link"
    t.string   "website"
    t.text     "areas_of_expertise"
    t.date     "birthday"
    t.string   "genre"
    t.string   "google_plus_link"
  end

  add_index "experts", ["confirmation_token"], name: "index_experts_on_confirmation_token", unique: true, using: :btree
  add_index "experts", ["email"], name: "index_experts_on_email", unique: true, using: :btree
  add_index "experts", ["reset_password_token"], name: "index_experts_on_reset_password_token", unique: true, using: :btree

  create_table "reservations", force: true do |t|
    t.datetime "starts_at",                        null: false
    t.datetime "final_time",                       null: false
    t.integer  "max_participants", default: 12,    null: false
    t.boolean  "all_day",          default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "calendar_id"
    t.integer  "workshop_id"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar"
    t.string   "occupation"
    t.text     "profile"
    t.date     "birthday"
    t.string   "genre"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "venue_pictures", force: true do |t|
    t.integer  "venue_id"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.text     "facilities"
    t.string   "map_link"
    t.string   "avatar"
    t.string   "description"
    t.string   "address"
    t.string   "business_hours"
  end

  add_index "venues", ["confirmation_token"], name: "index_venues_on_confirmation_token", unique: true, using: :btree
  add_index "venues", ["email"], name: "index_venues_on_email", unique: true, using: :btree
  add_index "venues", ["reset_password_token"], name: "index_venues_on_reset_password_token", unique: true, using: :btree

  create_table "workshops", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "length"
    t.string   "previous_skills"
    t.text     "agenda"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "target_public"
    t.text     "description"
    t.integer  "max_number_participants"
    t.integer  "state",                   default: 0
    t.integer  "expert_id"
    t.boolean  "free",                    default: false
    t.integer  "min_number_participants", default: 1
  end

end
