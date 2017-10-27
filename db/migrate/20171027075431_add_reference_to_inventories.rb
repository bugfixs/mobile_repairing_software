class AddReferenceToInventories < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventories, :transfer, foreign_key: true
  end
end
