class AddImeiColumnFieldsToEngineerDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :engineer_details, :imei_1, :string
    add_column :engineer_details, :imei_2, :string
  end
end
