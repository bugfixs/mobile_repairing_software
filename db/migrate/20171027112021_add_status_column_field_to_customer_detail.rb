class AddStatusColumnFieldToCustomerDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_details, :status, :string
  end
end
