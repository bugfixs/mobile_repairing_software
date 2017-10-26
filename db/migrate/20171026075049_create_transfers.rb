class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.string :transfer_item
       t.string :remark
       t.string :transfer_id
      t.references :inventory_type, foreign_key: true
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
