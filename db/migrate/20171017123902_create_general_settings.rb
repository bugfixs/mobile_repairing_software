class CreateGeneralSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :general_settings do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :email

      t.timestamps
    end
  end
end
