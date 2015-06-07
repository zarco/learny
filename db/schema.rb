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

ActiveRecord::Schema.define(version: 20150507170403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "name",                   limit: 255,              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true, using: :btree
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree

  create_table "calendars", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id",                              null: false
    t.boolean  "is_default", default: false,            null: false
    t.datetime "deleted_at"
    t.string   "title",      default: "Mesa principal", null: false
  end

  add_index "calendars", ["deleted_at"], name: "index_calendars_on_deleted_at", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "mail",       limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "workshop_id",    null: false
    t.integer  "student_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.float    "deposit"
    t.boolean  "paid_full"
    t.float    "paid_online"
    t.float    "pay_on_site"
    t.string   "payment_method"
    t.string   "payment_id"
    t.string   "payment_state"
    t.datetime "paid_at"
  end

  add_index "enrollments", ["deleted_at"], name: "index_enrollments_on_deleted_at", using: :btree

  create_table "experts", force: :cascade do |t|
    t.string   "first_name",             limit: 255,              null: false
    t.string   "last_name",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "occupation",             limit: 255
    t.text     "profile"
    t.string   "facebook_link",          limit: 255
    t.string   "twitter_link",           limit: 255
    t.string   "linkedin_link",          limit: 255
    t.string   "website",                limit: 255
    t.text     "areas_of_expertise"
    t.date     "birthday"
    t.string   "genre",                  limit: 255
    t.string   "google_plus_link",       limit: 255
    t.datetime "deleted_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "experts", ["confirmation_token"], name: "index_experts_on_confirmation_token", unique: true, using: :btree
  add_index "experts", ["deleted_at"], name: "index_experts_on_deleted_at", using: :btree
  add_index "experts", ["email"], name: "index_experts_on_email", unique: true, using: :btree
  add_index "experts", ["reset_password_token"], name: "index_experts_on_reset_password_token", unique: true, using: :btree

  create_table "guests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "workshop",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "starts_at",                        null: false
    t.datetime "final_time",                       null: false
    t.integer  "max_participants", default: 12,    null: false
    t.boolean  "all_day",          default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "calendar_id",                      null: false
    t.integer  "workshop_id"
    t.integer  "cover",            default: 0
    t.datetime "deleted_at"
  end

  add_index "reservations", ["deleted_at"], name: "index_reservations_on_deleted_at", using: :btree

  create_table "student_surveys", force: :cascade do |t|
    t.integer  "rating_workshop",  default: 0, null: false
    t.integer  "rating_expert",    default: 0, null: false
    t.integer  "rating_venue",     default: 0, null: false
    t.integer  "rating_learny",    default: 0, null: false
    t.text     "workshop_comment"
    t.text     "venue_comment"
    t.integer  "workshop_id",                  null: false
    t.integer  "student_id",                   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name",             limit: 255,              null: false
    t.string   "last_name",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "occupation",             limit: 255
    t.text     "profile"
    t.date     "birthday"
    t.string   "genre",                  limit: 255
    t.datetime "deleted_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "students", ["deleted_at"], name: "index_students_on_deleted_at", using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "venue_pictures", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "avatar",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name",                   limit: 255,              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.text     "facilities"
    t.string   "map_link",               limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "description",            limit: 255
    t.string   "address",                limit: 255
    t.string   "business_hours",         limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.string   "facebook_link",          limit: 255
    t.string   "twitter_link",           limit: 255
    t.string   "website",                limit: 255
    t.string   "google_plus_link",       limit: 255
    t.datetime "deleted_at"
    t.integer  "zone_id"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "venues", ["confirmation_token"], name: "index_venues_on_confirmation_token", unique: true, using: :btree
  add_index "venues", ["deleted_at"], name: "index_venues_on_deleted_at", using: :btree
  add_index "venues", ["email"], name: "index_venues_on_email", unique: true, using: :btree
  add_index "venues", ["reset_password_token"], name: "index_venues_on_reset_password_token", unique: true, using: :btree

  create_table "workshops", force: :cascade do |t|
    t.string   "name",                    limit: 255,                 null: false
    t.integer  "price"
    t.integer  "length",                              default: 2,     null: false
    t.string   "previous_skills",         limit: 255
    t.text     "agenda"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "target_public",           limit: 255
    t.text     "description"
    t.integer  "max_number_participants",             default: 12,    null: false
    t.integer  "expert_id"
    t.boolean  "free",                                default: false, null: false
    t.integer  "min_number_participants",             default: 1,     null: false
    t.string   "state",                   limit: 255, default: "new", null: false
    t.datetime "deleted_at"
    t.integer  "zone_id"
    t.datetime "proposed_date"
  end

  add_index "workshops", ["deleted_at"], name: "index_workshops_on_deleted_at", using: :btree

  create_table "zones", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "zones", ["deleted_at"], name: "index_zones_on_deleted_at", using: :btree

  add_foreign_key "calendars", "venues", name: "calendars_venue_id_fk"
  add_foreign_key "enrollments", "students", name: "enrollments_student_id_fk"
  add_foreign_key "enrollments", "workshops", name: "enrollments_workshop_id_fk"
  add_foreign_key "reservations", "calendars", name: "reservations_calendar_id_fk"
  add_foreign_key "reservations", "workshops", name: "reservations_workshop_id_fk"
  add_foreign_key "student_surveys", "students"
  add_foreign_key "student_surveys", "workshops"
  add_foreign_key "venues", "zones"
  add_foreign_key "workshops", "experts", name: "workshops_expert_id_fk"
  add_foreign_key "workshops", "zones"
end
