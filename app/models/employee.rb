class Employee < ApplicationRecord
  belongs_to :employee_type

  def self.set_employee_no
    date = Date.today.strftime('%d')
    if Employee.first.nil?
      'S' + date.to_s + '1'
    else
      last_id = Employee.last.id.next
      'S' + date.to_s + last_id.to_s
    end
  end
end
