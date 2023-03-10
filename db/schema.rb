# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_16_060941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "division_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["division_id"], name: "index_affiliations_on_division_id"
    t.index ["user_id"], name: "index_affiliations_on_user_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "division_id", null: false
    t.index ["division_id"], name: "index_educations_on_division_id"
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_positions_on_role_id"
    t.index ["user_id", "role_id"], name: "index_positions_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_positions_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name", null: false
    t.date "hire_date"
    t.string "job"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "superior_id"
    t.integer "subordinate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subordinate_id"], name: "index_relationships_on_subordinate_id"
    t.index ["superior_id", "subordinate_id"], name: "index_relationships_on_superior_id_and_subordinate_id", unique: true
    t.index ["superior_id"], name: "index_relationships_on_superior_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "purpose", null: false
    t.date "education_period"
    t.date "created_date"
    t.text "remarks"
    t.bigint "education_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["education_id"], name: "index_statuses_on_education_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "status", default: false, null: false
    t.date "deadline"
    t.bigint "education_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["education_id"], name: "index_subjects_on_education_id"
    t.index ["user_id"], name: "index_subjects_on_user_id"
  end

  create_table "teachings", force: :cascade do |t|
    t.date "date", null: false
    t.string "educator", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.text "advice"
    t.text "remarks"
    t.bigint "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["subject_id"], name: "index_teachings_on_subject_id"
    t.index ["user_id"], name: "index_teachings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "affiliations", "divisions"
  add_foreign_key "affiliations", "users"
  add_foreign_key "educations", "divisions"
  add_foreign_key "educations", "users"
  add_foreign_key "positions", "roles"
  add_foreign_key "positions", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "statuses", "educations"
  add_foreign_key "subjects", "educations"
  add_foreign_key "subjects", "users"
  add_foreign_key "teachings", "subjects"
  add_foreign_key "teachings", "users"
end
