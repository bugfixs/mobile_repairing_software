class AddColumnFieldsStatusToEngineerDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :engineer_details, :status, :string
  end
end
