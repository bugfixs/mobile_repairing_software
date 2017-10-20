json.extract! customer_detail, :id, :customer_name, :date, :address, :customer_no, :telephone_no, :mobile_no, :model_name, :purchase_date, :serial_no, :full_warranty, :labor_only, :parts_only, :out_of_warranty, :repair_received, :repair_completed, :good_delivered, :return_by_date, :defect_description, :b2b_svc, :accessory, :remark, :repair_description, :condition_code, :symptom_code, :defect_code, :repair_code, :created_at, :updated_at
json.url customer_detail_url(customer_detail, format: :json)