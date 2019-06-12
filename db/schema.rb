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

ActiveRecord::Schema.define(version: 2019_06_12_150650) do

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
    t.date "date"
    t.time "hour"
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

end
