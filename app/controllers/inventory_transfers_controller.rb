class InventoryTransfersController < ApplicationController
	# get all courses from database
  # create new object of inventory,
  # and perform authorization
  def index
    @inventories ||= Inventory.all
    @inventory = Inventory.new
  end

  # find inventory_type which we selected,
  # and perform authorization
  def select
    @inventory_type = InventoryType.shod(params[:inventory_transfer][:id])
    @inventory_types = InventoryType.all
  end

  # findinventory_type which we selected, get all students in that batch
  # and perform authorization
  def transfer
    @inventory_type = InventoryType.find_by_id(params[:id])
    @inventory = params[:inventory_type_id]
    @inventories = @inventory_type.inventories
  end

  # get all products of that inventory
  # this method is use for select all inventory_type in one click
  # and perform authorization
  def assign_all
      @inventories = Inventory.all
  end

  # get all products of that inventory
  # this method is use for deselect all student in one click
  # and perform authorization
  def remove_all
    @inventories = Inventory.all
  end

  # this method is used to transfer inventory
  # from one inventory to another inventory
  # and perform authorization
  def inventory_transfer
    @inventory = InventoryType.shod(params[:transfer][:id])
    trans(params[:inventories], params[:transfer][:id], @inventory)
    inventory_transfer2
  end

  # this method is used to transfer inventory
  # from one inventory_type to another inventory_type and stored inventory data in inventory log
  def trans(inventories, transfer_id, inventory_type)
    return unless inventories.present?
    inventories.each  do |inventory|
         InventoryLog.create(inventory_type_id: inventory_type.id)
    end
   inventories.each  do |inventory|
      Inventory.find(inventory).update(inventory_type_id: transfer_id)
    end
  end

  # redirect to transfer page
  def inventory_transfer2
    flash[:notice] = 'inventory_transfer'
    redirect_to inventory_transfers_path
  end
end