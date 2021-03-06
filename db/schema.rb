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

ActiveRecord::Schema.define(version: 2019_05_23_192716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attraction_categories", force: :cascade do |t|
    t.integer "attraction_id"
    t.integer "category_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "city"
    t.string "state"
    t.string "county"
    t.string "country"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: false
    t.integer "created_by"
  end

  create_table "bidders", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "website"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bids", force: :cascade do |t|
    t.string "amount"
    t.string "link"
    t.integer "vacation_id"
    t.integer "bidder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bucket_list_items", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.text "notes"
    t.integer "vacation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "panel_a_rgb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "departure_city"
    t.date "departure_date"
    t.string "return_city"
    t.date "return_date"
    t.string "notes"
    t.string "vacation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_attractions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacation_attractions", force: :cascade do |t|
    t.integer "vacation_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacations", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "budget"
    t.integer "number_of_travelers", default: 1
    t.string "notes"
    t.boolean "open_to_bids", default: false
    t.integer "bucket_list_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

end
