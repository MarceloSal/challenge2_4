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

ActiveRecord::Schema.define(version: 2022_12_01_184550) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "citizen_addresses", force: :cascade do |t|
    t.string "zip_code"
    t.string "public_place"
    t.string "complement"
    t.string "district"
    t.string "city"
    t.string "federative_unit"
    t.string "ibge"
    t.integer "citizen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citizen_id"], name: "index_citizen_addresses_on_citizen_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "cpf", null: false
    t.string "cns", null: false
    t.string "email", null: false
    t.date "birthday", null: false
    t.string "phone", null: false
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
