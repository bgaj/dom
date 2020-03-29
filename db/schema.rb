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

ActiveRecord::Schema.define(version: 2020_03_29_113815) do

  create_table "area_classes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "name"
    t.float "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "area_class_id"
    t.integer "status"
    t.date "cultivate_from"
    t.string "comment"
    t.index ["area_class_id"], name: "index_areas_on_area_class_id"
  end

  create_table "areas_events", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "event_id"
    t.integer "area_id"
    t.index ["area_id"], name: "index_areas_events_on_area_id"
    t.index ["event_id"], name: "index_areas_events_on_event_id"
  end

  create_table "coordinates", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "coordinate"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_coordinates_on_area_id"
  end

  create_table "crops", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "kind"
    t.date "sown_at"
    t.date "harvest_at"
    t.float "crop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "area_id"
    t.integer "variant_id"
    t.text "description"
    t.index ["area_id"], name: "index_crops_on_area_id"
    t.index ["variant_id"], name: "index_crops_on_variant_id"
  end

  create_table "events", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "event"
    t.date "made_at"
    t.text "description"
    t.text "comment"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forage_elements", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "forage_id"
    t.integer "kind"
    t.float "weight"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forage_id"], name: "index_forage_elements_on_forage_id"
  end

  create_table "forages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.date "made_at"
    t.integer "throw_id"
    t.string "type"
    t.string "template_name"
    t.index ["throw_id"], name: "index_forages_on_throw_id"
  end

  create_table "invoice_elements", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "vat_kind"
    t.integer "invoice_id"
    t.float "netto"
    t.float "vat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_elements_on_invoice_id"
  end

  create_table "invoice_templates", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "account_number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "list_number"
    t.string "number"
    t.date "made_at"
    t.date "recived_at"
    t.string "nip"
    t.string "account_number"
    t.string "name"
    t.string "city"
    t.string "post"
    t.integer "pay_time"
    t.date "pay_date"
    t.float "price"
    t.boolean "status", default: false
    t.integer "kind"
    t.string "scan_file_name"
    t.string "scan_content_type"
    t.integer "scan_file_size"
    t.datetime "scan_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "name"
    t.float "hours"
    t.date "buy"
    t.date "sell"
    t.date "made_at"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.text "message"
    t.datetime "last_notification"
    t.date "dead_line"
    t.boolean "finished", default: false
    t.integer "notificaable_id"
    t.string "notificaable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.date "sell_at"
    t.float "price"
    t.float "total"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.float "total_netto"
    t.float "vat"
  end

  create_table "throws", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.date "buy_at"
    t.string "number"
    t.integer "qty"
    t.float "buy_cost"
    t.float "weight"
    t.integer "sell_qty"
    t.integer "drop_qty"
    t.boolean "close", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "eat_weight", default: 0.0
    t.float "eat_costs", default: 0.0
    t.float "additional_costs", default: 0.0
    t.float "sell_total", default: 0.0
    t.float "weight_total", default: 0.0
  end

  create_table "throws_assignments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "throw_id"
    t.integer "sale_id"
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price", default: 0.0
    t.float "weight", default: 0.0
    t.index ["sale_id"], name: "index_throws_assignments_on_sale_id"
    t.index ["throw_id"], name: "index_throws_assignments_on_throw_id"
  end

  create_table "todos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.date "expire"
    t.boolean "seen", default: false
    t.boolean "done", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "kind"
    t.string "name"
  end

end
