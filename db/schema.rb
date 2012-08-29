# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120827194917) do

  create_table "articles", :id => false, :force => true do |t|
    t.integer  "id",                             :default => 0, :null => false
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
    t.boolean  "main_article"
    t.integer  "weight"
    t.boolean  "got_comments"
    t.string   "youtube_link"
    t.integer  "byline_user_id"
    t.string   "byline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spp_article_image_file_name"
    t.string   "spp_article_image_content_type"
    t.integer  "spp_article_image_file_size"
    t.datetime "spp_article_image_updated_at"
  end

  create_table "event_dates", :id => false, :force => true do |t|
    t.integer  "id",             :default => 0, :null => false
    t.datetime "date"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "alt_ticket_url"
    t.boolean  "sold_out"
  end

  create_table "event_places", :id => false, :force => true do |t|
    t.integer  "id",         :default => 0, :null => false
    t.string   "title"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :id => false, :force => true do |t|
    t.integer  "id",         :default => 0, :null => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :id => false, :force => true do |t|
    t.integer  "id",                                :default => 0, :null => false
    t.string   "title",              :limit => 100
    t.integer  "event_type_id"
    t.datetime "date"
    t.string   "place",              :limit => 100
    t.integer  "price_member"
    t.integer  "price_other"
    t.text     "ingress"
    t.text     "description"
    t.integer  "related_event_id"
    t.boolean  "deleted"
    t.boolean  "important"
    t.boolean  "visible"
    t.string   "url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "visible_at"
    t.boolean  "show_headline"
    t.integer  "weight"
    t.string   "color"
    t.integer  "size"
    t.string   "event_type_text"
    t.string   "facebook_url"
    t.string   "lineup_title"
    t.integer  "event_place_id"
    t.string   "spec_place"
    t.boolean  "isfit"
    t.boolean  "spp"
  end

  create_table "galleries", :id => false, :force => true do |t|
    t.integer  "id",               :default => 0, :null => false
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "limited_to_group", :default => 0, :null => false
  end

  create_table "gallery_albums", :id => false, :force => true do |t|
    t.integer  "id",          :default => 0, :null => false
    t.integer  "creator"
    t.integer  "album_cover"
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.integer  "gallery_id"
    t.integer  "feedback_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_photos", :id => false, :force => true do |t|
    t.integer  "id",                 :default => 0, :null => false
    t.integer  "uploader"
    t.string   "title"
    t.text     "description"
    t.integer  "gallery_album_id"
    t.integer  "feedback_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "pages", :id => false, :force => true do |t|
    t.integer  "id",             :default => 0, :null => false
    t.string   "title_en"
    t.text     "ingress_en"
    t.text     "body_en"
    t.string   "image_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "byline_func_id"
    t.string   "byline"
  end

  create_table "photos", :id => false, :force => true do |t|
    t.integer  "id",                                         :default => 0, :null => false
    t.string   "image_text_en"
    t.string   "image_text_no"
    t.string   "description"
    t.string   "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "original_picture_file_name"
    t.string   "original_picture_content_type"
    t.integer  "original_picture_file_size"
    t.datetime "original_picture_updated_at"
    t.string   "half_article_picture_file_name"
    t.string   "half_article_picture_content_type"
    t.integer  "half_article_picture_file_size"
    t.datetime "half_article_picture_updated_at"
    t.string   "full_article_picture_file_name"
    t.string   "full_article_picture_content_type"
    t.integer  "full_article_picture_file_size"
    t.datetime "full_article_picture_updated_at"
    t.string   "spp_one_third_article_picture_file_name"
    t.string   "spp_one_third_article_picture_content_type"
    t.integer  "spp_one_third_article_picture_file_size"
    t.datetime "spp_one_third_article_picture_updated_at"
    t.string   "spp_full_article_picture_file_name"
    t.string   "spp_full_article_picture_content_type"
    t.integer  "spp_full_article_picture_file_size"
    t.datetime "spp_full_article_picture_updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", :id => false, :force => true do |t|
    t.integer  "id",           :default => 0, :null => false
    t.text     "quote"
    t.string   "name"
    t.string   "position"
    t.boolean  "top"
    t.boolean  "side"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
    t.string   "picture_path"
  end

  create_table "sublinks", :id => false, :force => true do |t|
    t.integer  "id",           :default => 0, :null => false
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

  create_table "tabs", :id => false, :force => true do |t|
    t.integer  "id",         :default => 0, :null => false
    t.string   "name_en"
    t.string   "name_no"
    t.string   "tag"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
