class Transfer < ApplicationRecord
  belongs_to :inventory_type, optional:true
  belongs_to :inventory, optional:true
end
