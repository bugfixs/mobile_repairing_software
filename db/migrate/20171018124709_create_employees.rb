class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact
      t.string :email
      t.string :address
      t.references :employee_type, foreign_key: true

      t.timestamps
    end
  end
end
