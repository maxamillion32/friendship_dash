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

ActiveRecord::Schema.define(version: 20141124183511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.string   "patient_identifier",                        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "city"
    t.string   "phone"
    t.integer  "health_worker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.string   "clinic"
    t.integer  "research_assistant_id"
    t.string   "status",                default: "pending"
  end

  create_table "responses", force: true do |t|
    t.string   "guid"
    t.integer  "participant_id"
    t.integer  "user_id"
    t.datetime "timestamp"
    t.string   "response_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_question_id"
  end

  add_index "responses", ["participant_id"], name: "index_responses_on_participant_id", using: :btree
  add_index "responses", ["survey_question_id"], name: "index_responses_on_survey_question_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "survey_collections", force: true do |t|
    t.integer  "survey_id"
    t.integer  "group_id"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "survey_collections", ["group_id"], name: "index_survey_collections_on_group_id", using: :btree
  add_index "survey_collections", ["survey_id"], name: "index_survey_collections_on_survey_id", using: :btree

  create_table "survey_questions", force: true do |t|
    t.string   "guid",                             null: false
    t.integer  "orderer",                          null: false
    t.string   "survey_type",                      null: false
    t.string   "language",                         null: false
    t.string   "data_label"
    t.text     "content"
    t.string   "response0"
    t.string   "response0_value"
    t.string   "response1"
    t.string   "response1_value"
    t.string   "response2"
    t.string   "response2_value"
    t.string   "response3"
    t.string   "response3_value"
    t.string   "response4"
    t.string   "response4_value"
    t.string   "response5"
    t.string   "response5_value"
    t.string   "response6"
    t.string   "response6_value"
    t.string   "response7"
    t.string   "response7_value"
    t.string   "response8"
    t.string   "response8_value"
    t.string   "response9"
    t.string   "response9_value"
    t.string   "response10"
    t.string   "response10_value"
    t.string   "response11"
    t.string   "response11_value"
    t.string   "response12"
    t.string   "response12_value"
    t.string   "response13"
    t.string   "response13_value"
    t.string   "response14"
    t.string   "response14_value"
    t.string   "response15"
    t.string   "response15_value"
    t.string   "response16"
    t.string   "response16_value"
    t.boolean  "required",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_id"
  end

  add_index "survey_questions", ["survey_id"], name: "index_survey_questions_on_survey_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "survey_name"
    t.string   "guid"
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
    t.string   "role"
    t.string   "pin"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "guid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
