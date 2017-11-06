class AddGeneralSettingReferenceToCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :customer_details, :general_setting, foreign_key: true
  end
end
