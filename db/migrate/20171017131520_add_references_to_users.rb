class AddReferencesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :general_setting, foreign_key: true
  end
end
