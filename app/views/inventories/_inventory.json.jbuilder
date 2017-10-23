json.extract! inventory, :id, :branch, :part_no, :description, :total_stock_qty, :warehouse_stock_qty, :engineer_stock_qty, :location1, :location2, :location3, :map, :total_stock_value, :status, :latest_modify_date, :remark, :inventory_type_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
