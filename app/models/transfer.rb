class Transfer < ApplicationRecord
  belongs_to :inventory_type, optional:true
  has_many :inventories, dependent: :destroy
end
