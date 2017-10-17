class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :employee_number
      t.string :email
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :mobile_no
      t.references :employee_type, foreign_key: true

      t.timestamps
    end
  end
end
