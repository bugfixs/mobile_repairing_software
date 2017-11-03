class AddGeneralSettingFieldsToCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_details, :testing_cost, :string
    add_column :customer_details, :repair_cost, :string
    add_column :customer_details, :software_testing_cost, :string
    add_column :customer_details, :gst, :string
  end
end
