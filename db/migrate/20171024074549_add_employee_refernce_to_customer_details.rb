class AddEmployeeRefernceToCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :customer_details, :employee, foreign_key: true
  end
end
