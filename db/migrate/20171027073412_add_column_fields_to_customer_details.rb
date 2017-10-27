class AddColumnFieldsToCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_details, :estimated_cost, :integer
    add_column :customer_details, :balance_cost, :integer
    add_column :customer_details, :advanced_paid, :integer
  end
end
