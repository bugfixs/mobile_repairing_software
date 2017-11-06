class EngineerDetail < ApplicationRecord
  belongs_to :customer_detail
  belongs_to :employee
  scope :shod, ->(id) { where(id: id).take }
end
