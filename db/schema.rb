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

ActiveRecord::Schema[7.0].define(version: 2024_07_02_170015) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "real_estates", force: :cascade do |t|
    t.string "address"
    t.integer "loan_term"
    t.integer "purchase_price"
    t.integer "repair_budget"
    t.integer "arv"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "profit", precision: 15, scale: 3
    t.decimal "loan_amount", precision: 15, scale: 3
  end

end
