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

ActiveRecord::Schema.define(version: 2019_07_03_184400) do

  create_table "cashes", force: :cascade do |t|
    t.string "category"
    t.decimal "price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.date "due_date"
    t.decimal "price"
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portions", force: :cascade do |t|
    t.integer "procedure_id"
    t.date "due_date"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["procedure_id"], name: "index_portions_on_procedure_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "number"
    t.integer "studant_id"
    t.string "category"
    t.decimal "class_a"
    t.decimal "class_b"
    t.decimal "class_t"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "due_date"
    t.index ["studant_id"], name: "index_procedures_on_studant_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "studant_id"
    t.date "date_s"
    t.time "hour_s"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studant_id"], name: "index_schedules_on_studant_id"
  end

  create_table "studants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "cpf"
    t.string "address"
    t.string "district"
    t.string "city"
    t.string "fone"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
