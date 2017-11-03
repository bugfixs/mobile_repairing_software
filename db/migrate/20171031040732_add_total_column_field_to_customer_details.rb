class AddTotalColumnFieldToCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_details, :grand_total, :integer
  end
end
