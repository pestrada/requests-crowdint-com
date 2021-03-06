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

ActiveRecord::Schema.define(:version => 20130222195307) do

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], :name => "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], :name => "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

  create_table "voting_app_comments", :force => true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "request_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "voting_app_requests", :force => true do |t|
    t.text     "description"
    t.datetime "accepted_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "state"
    t.integer  "cached_votes_total", :default => 0
    t.integer  "cached_votes_score", :default => 0
    t.integer  "cached_votes_up",    :default => 0
    t.integer  "cached_votes_down",  :default => 0
    t.integer  "user_id"
    t.datetime "promoted_at"
    t.datetime "rejected_at"
    t.datetime "done_at"
    t.string   "category"
  end

  add_index "voting_app_requests", ["cached_votes_down"], :name => "index_voting_app_submissions_on_cached_votes_down"
  add_index "voting_app_requests", ["cached_votes_score"], :name => "index_voting_app_submissions_on_cached_votes_score"
  add_index "voting_app_requests", ["cached_votes_total"], :name => "index_voting_app_submissions_on_cached_votes_total"
  add_index "voting_app_requests", ["cached_votes_up"], :name => "index_voting_app_submissions_on_cached_votes_up"

  create_table "voting_app_users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "sign_in_count",        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "admin"
  end

  add_index "voting_app_users", ["authentication_token"], :name => "index_voting_app_users_on_authentication_token", :unique => true
  add_index "voting_app_users", ["email"], :name => "index_voting_app_users_on_email", :unique => true

end
