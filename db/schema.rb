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

ActiveRecord::Schema[7.1].define(version: 2023_12_19_151608) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "state_id", null: false
    t.string "name"
    t.string "zip"
    t.integer "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["name"], name: "index_cities_on_name", unique: true
    t.index ["state_id"], name: "index_cities_on_state_id"
    t.index ["zip"], name: "index_cities_on_zip"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_countries_on_code", unique: true
    t.index ["is_active"], name: "index_countries_on_is_active"
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "states", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "name"
    t.string "abbreviation"
    t.string "capital"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_states_on_abbreviation"
    t.index ["capital"], name: "index_states_on_capital", unique: true
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["is_active"], name: "index_states_on_is_active"
    t.index ["name"], name: "index_states_on_name", unique: true
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "states"
  add_foreign_key "states", "countries"
end
