class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.string :branch
      t.string :part_no
      t.text :description
      t.string :total_stock_qty
      t.string :warehouse_stock_qty
      t.string :engineer_stock_qty
      t.string :location1
      t.string :location2
      t.string :location3
      t.string :map
      t.string :total_stock_value
      t.string :status
      t.date :latest_modify_date
      t.text :remark
      t.references :inventory_type, foreign_key: true

      t.timestamps
    end
  end
end
