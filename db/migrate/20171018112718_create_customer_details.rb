class CreateCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_details do |t|
      t.string :bill_no
      t.string :customer_name
      t.date :date
      t.string :address
      t.string :customer_no
      t.string :telephone_no
      t.string :mobile_no
      t.string :mobile_modal_name
      t.date :purchase_date
      t.string :serial_no
      t.string :full_warranty
      t.string :labor_only
      t.string :parts_only
      t.string :out_of_warranty
      t.string :repair_received
      t.string :repair_completed
      t.string :good_delivered
      t.date :return_by_date
      t.string :defect_description
      t.string :b2b_svc
      t.string :accessory
      t.string :repair_description
      t.string :condition_code
      t.string :symptom_code
      t.string :defect_code
      t.string :repair_code

      t.timestamps
    end
  end
end
