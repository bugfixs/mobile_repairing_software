class InventoryType < ApplicationRecord
	 scope :shod, ->(id) { where(id: id).take }

	has_many :inventories, dependent: :destroy

end
