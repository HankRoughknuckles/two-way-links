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

ActiveRecord::Schema.define(version: 2019_03_03_092609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "links", force: :cascade do |t|
    t.integer "source_id"
    t.integer "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_links_on_source_id"
    t.index ["target_id"], name: "index_links_on_target_id"
  end

  create_table "resources", force: :cascade do |t|
    t.bigint "website_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_resources_on_url"
    t.index ["website_id"], name: "index_resources_on_website_id"
  end

  create_table "websites", force: :cascade do |t|
    t.string "domain_and_suffix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_and_suffix"], name: "index_websites_on_domain_and_suffix"
  end

end
