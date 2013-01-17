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

ActiveRecord::Schema.define(:version => 20130117135239) do

  create_table "api_keys", :force => true do |t|
    t.string   "access_token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "app_infos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "app_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image"
    t.string   "apple_id"
    t.string   "bundle_id"
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
    t.string   "summary"
    t.string   "exec_date"
    t.string   "pub_dept"
    t.string   "catalog"
    t.text     "content"
    t.integer  "version",         :default => 1
    t.boolean  "visible",         :default => true
    t.string   "action",          :default => "add", :null => false
    t.integer  "law_category_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "law_udid"
  end

  add_index "law_details", ["law_category_id"], :name => "index_law_details_on_law_category_id"
  add_index "law_details", ["title"], :name => "index_law_details_on_title"
  add_index "law_details", ["version"], :name => "index_law_details_on_version"

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
