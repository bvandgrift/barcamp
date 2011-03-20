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

ActiveRecord::Schema.define(:version => 20110320194300) do

  create_table "acceptances", :force => true do |t|
    t.integer  "talk_id",    :null => false
    t.integer  "room_id",    :null => false
    t.integer  "barcamp_id", :null => false
    t.integer  "period_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "barcamps", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "url"
    t.boolean  "active",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", :force => true do |t|
    t.integer  "barcamp_id", :null => false
    t.string   "name",       :null => false
    t.datetime "start_time", :null => false
    t.datetime "end_time",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "barcamp_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "talks", :force => true do |t|
    t.string   "title"
    t.string   "speaker_name", :null => false
    t.string   "hashtag"
    t.integer  "barcamp_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "encrypted_password",                 :null => false
    t.string   "password_salt",                      :null => false
    t.string   "reset_password_token", :limit => 20
    t.string   "remember_token",       :limit => 20
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oauth_provider"
    t.string   "handle"
    t.string   "avatar_url"
  end

end
