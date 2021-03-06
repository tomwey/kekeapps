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

ActiveRecord::Schema.define(:version => 20130707084057) do

  create_table "api_keys", :force => true do |t|
    t.string   "access_token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "app_infos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "app_url"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "image"
    t.string   "apple_id"
    t.string   "bundle_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "law_details_count",   :default => 0
  end

  create_table "device_infos", :force => true do |t|
    t.string   "device_token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "device_infos_notifications", :force => true do |t|
    t.integer "notification_id"
    t.integer "device_info_id"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "app_info_id"
  end

  create_table "law_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "visible",     :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "law_data", :force => true do |t|
    t.string   "pub_date"
    t.string   "title"
    t.string   "docID"
    t.string   "gov_cmd"
    t.string   "exec_date"
    t.string   "pub_dept"
    t.text     "content"
    t.integer  "parent_id"
    t.integer  "version",    :default => 1
    t.boolean  "visible",    :default => true
    t.string   "action",     :default => "Add", :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "catalog"
  end

  add_index "law_data", ["parent_id"], :name => "index_law_data_on_parent_id"
  add_index "law_data", ["title"], :name => "index_law_data_on_title"
  add_index "law_data", ["version"], :name => "index_law_data_on_version"

  create_table "law_details", :force => true do |t|
    t.string   "pub_date"
    t.string   "title"
    t.string   "doc_id"
    t.text     "summary"
    t.string   "exec_date"
    t.string   "pub_dept"
    t.text     "catalog"
    t.text     "content"
    t.integer  "version",         :default => 1
    t.boolean  "visible",         :default => true
    t.string   "action",          :default => "add", :null => false
    t.integer  "law_category_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "law_udid"
    t.integer  "app_info_id"
    t.integer  "law_type_id"
  end

  add_index "law_details", ["app_info_id"], :name => "index_law_details_on_app_info_id"
  add_index "law_details", ["law_category_id"], :name => "index_law_details_on_law_category_id"
  add_index "law_details", ["law_udid"], :name => "index_law_details_on_law_udid", :unique => true
  add_index "law_details", ["title"], :name => "index_law_details_on_title"
  add_index "law_details", ["version"], :name => "index_law_details_on_version"

  create_table "law_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "db_name"
  end

  create_table "news_blasts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "newsblasts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notifications", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
