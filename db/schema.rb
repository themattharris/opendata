# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120422230237) do

  create_table "categories", :force => true do |t|
    t.string "slug"
    t.string "title"
  end

  create_table "curators", :force => true do |t|
    t.string   "person_name"
    t.string   "person_email"
    t.string   "url"
    t.string   "org"
    t.string   "center"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_source_categories", :force => true do |t|
    t.integer "data_source_id"
    t.string  "category_id"
  end

  create_table "data_source_curators", :force => true do |t|
    t.integer "data_source_id"
    t.string  "curator_id"
  end

  create_table "data_source_tags", :force => true do |t|
    t.integer "data_source_id"
    t.string  "tag_id"
  end

  create_table "data_sources", :force => true do |t|
    t.integer  "remote_id"
    t.integer  "parent_id"
    t.string   "url"
    t.string   "title"
    t.text     "content"
    t.string   "more_info_link"
    t.string   "acronym"
    t.string   "datagov_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string "slug"
    t.string "title"
  end

end
