json.extract! employee, :id, :first_name, :middle_name, :last_name, :contact, :email, :address, :employee_type_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
