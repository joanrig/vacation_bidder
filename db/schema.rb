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

ActiveRecord::Schema.define(version: 2019_05_14_010645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attraction_categories", force: :cascade do |t|
    t.integer "attraction_id"
    t.integer "category_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.integer "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bucket_attractions", force: :cascade do |t|
    t.integer "bucket_list_item_id"
    t.integer "attraction_id"
  end

  create_table "bucket_list_items", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "vacation_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "organizer", default: false
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacations", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "budget"
    t.integer "number_of_users"
    t.integer "requirements_id"
    t.integer "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
