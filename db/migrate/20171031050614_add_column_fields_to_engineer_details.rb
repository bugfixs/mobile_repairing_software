class AddColumnFieldsToEngineerDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :engineer_details, :compalint_type, :string
    add_column :engineer_details, :grand_total, :string
    add_column :engineer_details, :estimated_cost, :string
    add_column :engineer_details, :balance_cost, :string
    add_column :engineer_details, :advanced_paid, :string
  end
end
