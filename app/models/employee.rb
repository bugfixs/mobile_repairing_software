class Employee < ApplicationRecord
  belongs_to :employee_type
  belongs_to :user, optional:true
  has_many :customer_details
  after_save :create_user_account
  validates :employee_number, presence: true
  validates :contact, presence: true
  validates :email, presence: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }

   # this method is used to calculate the employee number
  # if first employee then append 1 to today date else
  # append last id to today date
  def emp_no
    date = Date.today.strftime('%Y%m%d')
    self.employee_number = date.to_s + '1' if Employee.first.nil?
    self.employee_number = date.to_s + \
                           Employee.last.id.next.to_s unless Employee.first.nil?
  end

  private

  # This action create the user for employee login.
  def create_user_account
    user = User.new do |u|
      u.email = email
      u.employee_id = id 
      u.password = employee_number
      u.role = 'Employee'
      u.general_setting_id = if User.current
                               User.current.general_setting_id
                             else
                               1
                             end
    end
    user.save
  end
end
