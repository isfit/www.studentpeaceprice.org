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

ActiveRecord::Schema.define(:version => 20101114132130) do

  create_table "articles", :id => false, :force => true do |t|
    t.integer  "id",            :default => 0, :null => false
    t.string   "title_en"
    t.string   "title_no"
    t.text     "ingress_en"
    t.text     "ingress_no"
    t.text     "body_en"
    t.text     "body_no"
    t.boolean  "press_release"
    t.boolean  "deleted"
    t.boolean  "visible"
    t.string   "image_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "main_article"
    t.integer  "weight"
    t.boolean  "got_comments"
  end

  create_table "pages", :force => true do |t|
    t.string   "title_en"
    t.text     "ingress_en"
    t.text     "body_en"
    t.string   "image_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", :force => true do |t|
    t.text     "quote"
    t.string   "name"
    t.string   "position"
    t.boolean  "top"
    t.boolean  "side"
    t.boolean  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_path"
  end

  create_table "sublinks", :force => true do |t|
    t.integer  "tab_id"
    t.string   "title_en"
    t.string   "title_no"
    t.string   "url"
    t.string   "external_url"
    t.integer  "weight"
    t.boolean  "deleted"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tabs", :force => true do |t|
    t.string   "name_en"
    t.string   "name_no"
    t.string   "tag"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
