class AddColumnFieldToGeneralSetting < ActiveRecord::Migration[5.1]
  def change
    add_column :general_settings, :sgst, :decimal
    add_column :general_settings, :cgst, :decimal
    add_column :general_settings, :igst, :decimal
  end
end
