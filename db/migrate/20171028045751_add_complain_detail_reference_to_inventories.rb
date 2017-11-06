class AddComplainDetailReferenceToInventories < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventories, :customer_detail, foreign_key: true
  end
end
