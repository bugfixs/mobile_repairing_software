json.extract! employee, :id, :employee_number, :email, :first_name, :middle_name, :last_name, :mobile_no, :employee_type_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
