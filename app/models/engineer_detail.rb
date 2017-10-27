class EngineerDetail < ApplicationRecord
  belongs_to :customer_detail
  belongs_to :employee
end
