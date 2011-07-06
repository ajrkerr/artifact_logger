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

ActiveRecord::Schema.define(:version => 20110706154303) do

  create_table "artifacts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_messages", :force => true do |t|
    t.string   "level",         :null => false
    t.string   "type"
    t.text     "text",          :null => false
    t.string   "artifact_type"
    t.integer  "artifact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "log_messages", ["artifact_id"], :name => "index_log_messages_on_artifact_id"
  add_index "log_messages", ["artifact_type"], :name => "index_log_messages_on_artifact_type"
  add_index "log_messages", ["level"], :name => "index_log_messages_on_level"
  add_index "log_messages", ["type"], :name => "index_log_messages_on_type"

end
