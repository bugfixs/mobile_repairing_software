class InventoryItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :customer_detail
  scope :shod, ->(id) { where(id: id).take }
end
