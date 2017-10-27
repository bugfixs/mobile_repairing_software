class InventoryType < ApplicationRecord
	 scope :shod, ->(id) { where(id: id).take }
	has_many :inventories, dependent: :destroy
	has_many :inventory_logs, dependent: :destroy
end