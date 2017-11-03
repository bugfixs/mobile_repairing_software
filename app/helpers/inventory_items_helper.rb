module InventoryItemsHelper

  def collect_inventory_type
    @inventory_types.collect { |b| [b.name, b.id] }
  end
   def collect_inventory
    @inventories.collect { |b| [b.part_no, b.id] }
  end

end
