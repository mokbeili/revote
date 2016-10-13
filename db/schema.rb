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

ActiveRecord::Schema.define(version: 20161006224647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.integer  "party_id"
    t.integer  "riding_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "last_name"
    t.index ["party_id"], name: "index_candidates_on_party_id", using: :btree
    t.index ["riding_id"], name: "index_candidates_on_riding_id", using: :btree
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "abbreviation"
    t.string   "fr_name"
  end

  create_table "riding_relationships", force: :cascade do |t|
    t.integer  "hypothetical_riding"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "postal_code_prefix"
    t.integer  "riding_id"
    t.index ["riding_id"], name: "index_riding_relationships_on_riding_id", using: :btree
  end

  create_table "ridings", force: :cascade do |t|
    t.string   "name"
    t.string   "province"
    t.string   "electoral_system"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "code"
    t.integer  "population"
    t.integer  "current_riding"
    t.integer  "riding_id"
    t.index ["riding_id"], name: "index_ridings_on_riding_id", using: :btree
  end

  create_table "voters", force: :cascade do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.string   "email"
    t.integer  "unit"
    t.integer  "street"
    t.string   "street_name"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "candidate_id"
    t.integer  "riding_id"
    t.integer  "rank"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "mmp_party"
    t.index ["candidate_id"], name: "index_votes_on_candidate_id", using: :btree
    t.index ["mmp_party"], name: "index_votes_on_mmp_party", using: :btree
    t.index ["riding_id"], name: "index_votes_on_riding_id", using: :btree
    t.index ["voter_id"], name: "index_votes_on_voter_id", using: :btree
  end

  add_foreign_key "candidates", "parties"
  add_foreign_key "candidates", "ridings"
  add_foreign_key "riding_relationships", "ridings"
  add_foreign_key "ridings", "ridings"
  add_foreign_key "votes", "candidates"
  add_foreign_key "votes", "ridings"
  add_foreign_key "votes", "voters"
end
