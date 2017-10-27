class AddReferenceToEngineerCopy < ActiveRecord::Migration[5.1]
  def change
    add_reference :engineer_copies, :employee, foreign_key: true
  end
end
