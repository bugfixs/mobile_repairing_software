class CreateInventoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.references :inventory

      t.timestamps
    end
  end
end
