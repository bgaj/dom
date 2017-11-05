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

ActiveRecord::Schema.define(version: 20171104142247) do

  create_table "area_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "area",           limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "area_class_id"
    t.integer  "status"
    t.date     "cultivate_from"
    t.string   "comment"
    t.index ["area_class_id"], name: "index_areas_on_area_class_id", using: :btree
  end

  create_table "areas_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "event_id"
    t.integer "area_id"
    t.index ["area_id"], name: "index_areas_events_on_area_id", using: :btree
    t.index ["event_id"], name: "index_areas_events_on_event_id", using: :btree
  end

  create_table "coordinates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "coordinate"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_coordinates_on_area_id", using: :btree
  end

  create_table "crops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kind"
    t.date     "sown_at"
    t.date     "harvest_at"
    t.float    "crop",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "area_id"
    t.integer  "variant_id"
    t.index ["area_id"], name: "index_crops_on_area_id", using: :btree
    t.index ["variant_id"], name: "index_crops_on_variant_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event"
    t.date     "made_at"
    t.text     "description", limit: 65535
    t.text     "comment",     limit: 65535
    t.float    "cost",        limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "forage_elements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer  "forage_id"
    t.integer  "kind"
    t.float    "weight",     limit: 24
    t.float    "price",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["forage_id"], name: "index_forage_elements_on_forage_id", using: :btree
  end

  create_table "forages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.date    "made_at"
    t.integer "throw_id"
    t.string  "type"
    t.string  "template_name"
    t.index ["throw_id"], name: "index_forages_on_throw_id", using: :btree
  end

  create_table "invoice_elements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer  "vat_kind"
    t.integer  "invoice_id"
    t.float    "netto",      limit: 24
    t.float    "vat",        limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["invoice_id"], name: "index_invoice_elements_on_invoice_id", using: :btree
  end

  create_table "invoice_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "account_number"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer  "list_number"
    t.string   "number"
    t.date     "made_at"
    t.date     "recived_at"
    t.string   "nip"
    t.string   "account_number"
    t.string   "name"
    t.string   "city"
    t.string   "post"
    t.integer  "pay_time"
    t.date     "pay_date"
    t.float    "price",             limit: 24
    t.boolean  "status",                       default: false
    t.integer  "kind"
    t.string   "scan_file_name"
    t.string   "scan_content_type"
    t.integer  "scan_file_size"
    t.datetime "scan_updated_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "machines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "hours",       limit: 24
    t.date     "buy"
    t.date     "sell"
    t.date     "made_at"
    t.string   "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.text     "message",           limit: 65535
    t.datetime "last_notification"
    t.date     "dead_line"
    t.boolean  "finished",                        default: false
    t.integer  "notificaable_id"
    t.string   "notificaable_type"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "sales", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.date     "sell_at"
    t.float    "price",       limit: 24
    t.float    "total",       limit: 24
    t.float    "weight",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "number"
    t.float    "total_netto", limit: 24
    t.float    "vat",         limit: 24
  end

  create_table "throw_additionals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name"
    t.float  "cost",    limit: 24
    t.string "comment"
  end

  create_table "throws", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.date     "buy_at"
    t.string   "number"
    t.integer  "qty"
    t.float    "buy_cost",         limit: 24
    t.float    "weight",           limit: 24
    t.integer  "sell_qty"
    t.integer  "drop_qty"
    t.boolean  "close",                       default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.float    "eat_weight",       limit: 24, default: 0.0
    t.float    "eat_costs",        limit: 24, default: 0.0
    t.float    "additional_costs", limit: 24, default: 0.0
    t.float    "sell_total",       limit: 24, default: 0.0
    t.float    "weight_total",     limit: 24, default: 0.0
  end

  create_table "throws_assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer  "throw_id"
    t.integer  "sale_id"
    t.integer  "qty"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "price",      limit: 24, default: 0.0
    t.float    "weight",     limit: 24, default: 0.0
    t.index ["sale_id"], name: "index_throws_assignments_on_sale_id", using: :btree
    t.index ["throw_id"], name: "index_throws_assignments_on_throw_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "variants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "kind"
    t.string  "name"
  end

end
