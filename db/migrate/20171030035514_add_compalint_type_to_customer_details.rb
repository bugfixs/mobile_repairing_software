class AddCompalintTypeToCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_details, :compalint_type, :string
  end
end
