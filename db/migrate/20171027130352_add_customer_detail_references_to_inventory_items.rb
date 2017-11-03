class AddCustomerDetailReferencesToInventoryItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventory_items, :customer_detail
  end
end
