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

ActiveRecord::Schema.define(version: 20171101065654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_details", force: :cascade do |t|
    t.string "bill_no"
    t.string "customer_name"
    t.date "date"
    t.string "address"
    t.string "customer_no"
    t.string "telephone_no"
    t.string "mobile_no"
    t.string "mobile_modal_name"
    t.date "purchase_date"
    t.string "serial_no"
    t.string "full_warranty"
    t.string "labor_only"
    t.string "parts_only"
    t.string "out_of_warranty"
    t.string "repair_received"
    t.string "repair_completed"
    t.string "good_delivered"
    t.date "return_by_date"
    t.string "defect_description"
    t.string "b2b_svc"
    t.string "accessory"
    t.string "repair_description"
    t.string "condition_code"
    t.string "symptom_code"
    t.string "defect_code"
    t.string "repair_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "general_setting"
    t.bigint "employee_id"
    t.integer "estimated_cost"
    t.integer "balance_cost"
    t.integer "advanced_paid"
    t.string "status"
    t.string "compalint_type"
    t.bigint "general_setting_id"
    t.integer "grand_total"
    t.string "testing_cost"
    t.string "repair_cost"
    t.string "software_testing_cost"
    t.string "gst"
    t.bigint "employee_type_id"
    t.index ["employee_id"], name: "index_customer_details_on_employee_id"
    t.index ["employee_type_id"], name: "index_customer_details_on_employee_type_id"
    t.index ["general_setting_id"], name: "index_customer_details_on_general_setting_id"
  end

  create_table "employee_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "contact"
    t.string "email"
    t.string "address"
    t.string "employee_number"
    t.bigint "employee_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_type_id"], name: "index_employees_on_employee_type_id"
  end

  create_table "engineer_copies", force: :cascade do |t|
    t.string "bill_no"
    t.string "customer_name"
    t.date "date"
    t.string "address"
    t.string "customer_no"
    t.string "telephone_no"
    t.string "mobile_no"
    t.string "mobile_modal_name"
    t.date "purchase_date"
    t.string "serial_no"
    t.string "full_warranty"
    t.string "labor_only"
    t.string "parts_only"
    t.string "out_of_warranty"
    t.string "repair_received"
    t.string "repair_completed"
    t.string "good_delivered"
    t.date "return_by_date"
    t.string "defect_description"
    t.string "b2b_svc"
    t.string "accessory"
    t.string "remark"
    t.string "repair_description"
    t.string "condition_code"
    t.string "symptom_code"
    t.string "defect_code"
    t.string "repair_code"
    t.bigint "customer_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_detail_id"], name: "index_engineer_copies_on_customer_detail_id"
  end

  create_table "engineer_details", force: :cascade do |t|
    t.string "bill_no"
    t.string "customer_name"
    t.date "date"
    t.string "address"
    t.string "customer_no"
    t.string "telephone_no"
    t.string "mobile_no"
    t.string "mobile_modal_name"
    t.date "purchase_date"
    t.string "serial_no"
    t.string "full_warranty"
    t.string "labor_only"
    t.string "parts_only"
    t.string "out_of_warranty"
    t.string "repair_received"
    t.string "repair_completed"
    t.string "good_delivered"
    t.date "return_by_date"
    t.string "defect_description"
    t.string "b2b_svc"
    t.string "accessory"
    t.string "repair_description"
    t.string "condition_code"
    t.string "symptom_code"
    t.string "defect_code"
    t.string "repair_code"
    t.bigint "customer_detail_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "compalint_type"
    t.string "grand_total"
    t.string "estimated_cost"
    t.string "balance_cost"
    t.string "advanced_paid"
    t.string "status"
    t.index ["customer_detail_id"], name: "index_engineer_details_on_customer_detail_id"
    t.index ["employee_id"], name: "index_engineer_details_on_employee_id"
  end

  create_table "general_settings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact"
    t.string "mobile_no"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "gst"
    t.string "testing_cost"
    t.string "repair_cost"
    t.string "software_testing_cost"
    t.decimal "sgst"
    t.decimal "cgst"
    t.decimal "igst"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "branch"
    t.string "part_no"
    t.text "description"
    t.string "total_stock_qty"
    t.string "transfered_stock_qty"
    t.string "warehouse_stock_qty"
    t.string "engineer_stock_qty"
    t.string "location1"
    t.string "location2"
    t.string "location3"
    t.string "map"
    t.string "total_stock_value"
    t.string "status"
    t.date "latest_modify_date"
    t.text "remark"
    t.bigint "inventory_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "transfer_id"
    t.bigint "customer_detail_id"
    t.index ["customer_detail_id"], name: "index_inventories_on_customer_detail_id"
    t.index ["inventory_type_id"], name: "index_inventories_on_inventory_type_id"
    t.index ["transfer_id"], name: "index_inventories_on_transfer_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name"
    t.bigint "inventory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_detail_id"
    t.bigint "inventory_type_id"
    t.index ["customer_detail_id"], name: "index_inventory_items_on_customer_detail_id"
    t.index ["inventory_id"], name: "index_inventory_items_on_inventory_id"
    t.index ["inventory_type_id"], name: "index_inventory_items_on_inventory_type_id"
  end

  create_table "inventory_logs", force: :cascade do |t|
    t.bigint "inventory_type_id"
    t.string "transfer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_type_id"], name: "index_inventory_logs_on_inventory_type_id"
  end

  create_table "inventory_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.string "transfer_item"
    t.string "remark"
    t.bigint "inventory_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_type_id"], name: "index_transfers_on_inventory_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role"
    t.integer "employee_id"
    t.bigint "general_setting_id"
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
    t.index ["general_setting_id"], name: "index_users_on_general_setting_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "customer_details", "employee_types"
  add_foreign_key "customer_details", "employees"
  add_foreign_key "customer_details", "general_settings"
  add_foreign_key "employees", "employee_types"
  add_foreign_key "engineer_copies", "customer_details"
  add_foreign_key "engineer_details", "customer_details"
  add_foreign_key "engineer_details", "employees"
  add_foreign_key "inventories", "customer_details"
  add_foreign_key "inventories", "inventory_types"
  add_foreign_key "inventories", "transfers"
  add_foreign_key "inventory_items", "inventory_types"
  add_foreign_key "inventory_logs", "inventory_types"
  add_foreign_key "transfers", "inventory_types"
end
