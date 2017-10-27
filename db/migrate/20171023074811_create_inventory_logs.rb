class CreateInventoryLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_logs do |t|
      t.references :inventory_type, foreign_key: true
      t.string :transfer_id

      t.timestamps
    end
  end
end
