module InventoryTransfersHelper
	def collect_inventory_type
		 @inventory_types.collect{|i| [i.name,i.id]}
	end
end
