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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150921221804) do

  create_table "collaborators", force: :cascade do |t|
    t.integer  "wiki_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collaborators", ["user_id"], name: "index_collaborators_on_user_id"
  add_index "collaborators", ["wiki_id"], name: "index_collaborators_on_wiki_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "email_confirmed",    default: false
    t.string   "confirm_token"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email"

  create_table "wikis", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "public"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "wikis", ["slug"], name: "index_wikis_on_slug"
  add_index "wikis", ["user_id"], name: "index_wikis_on_user_id"

end
