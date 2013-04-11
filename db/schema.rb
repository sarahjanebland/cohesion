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

ActiveRecord::Schema.define(:version => 20130411192153) do

  create_table "admins", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admins", ["user_id"], :name => "index_admins_on_user_id"

  create_table "cohorts", :force => true do |t|
    t.string   "name"
    t.string   "start_date"
    t.string   "email"
    t.string   "photos_url"
    t.string   "secret_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "providers", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "providers", ["user_id"], :name => "index_providers_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "cohort_id"
    t.integer  "github_uid"
    t.string   "github_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "email"
    t.string   "session_token"
    t.string   "phone"
    t.string   "company"
    t.string   "location"
    t.string   "advice"
    t.string   "restaurant"
    t.string   "photo_url"
    t.string   "website_url"
    t.string   "blog_url"
    t.string   "provider"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "github_url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
