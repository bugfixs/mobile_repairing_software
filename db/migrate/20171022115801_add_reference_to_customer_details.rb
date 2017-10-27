class AddReferenceToCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_details, :general_setting, :string
  end
end
