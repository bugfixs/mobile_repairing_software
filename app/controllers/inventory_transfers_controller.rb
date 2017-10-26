class InventoryTransfersController < ApplicationController
	# get all courses from database
  # create new object of inventory,
  # and perform authorization
  def index
    @inventories ||= Inventory.all
    @inventory = Inventory.new
    @inventory_types = InventoryType.all
  end

  # find inventory_type which we selected,
  # and perform authorization
  def select
     @inventory_type = InventoryType.shod(params[:inventory_type_id])
     @inventory_types = InventoryType.all
    @inventories = @inventory_type.inventories
  end

  # findinventory_type which we selected, get all students in that batch
  # and perform authorization
  def transfer
    @inventory_type = InventoryType.find_by_id(params[:id])
    @inventory =Inventory.find_by_id(params[:format])
  end
  

  # this method is used to transfer inventory
  # from one inventory to another inventory
  # and perform authorization
 def inventory_transfer
  puts "#{params}".inspect
 if params[:remark] && params[:transfer_item].present? 
   Transfer.create!(remark: params[:remark], transfer_item: params[:transfer_item]) 
 end
    @inventory = InventoryType.shod(params[:transfer][:id])
    trans(params[:inventory], params[:transfer][:id], @inventory)
    inventory_transfer2
  end

  # this method is used to transfer inventory
  # from one inventory_type to another inventory_type and stored inventory data in inventory log
  def trans(inventory, transfer_id, inventory_type)
         @inventory_log = InventoryLog.create!(inventory_type_id: inventory_type.id)
         @inventory_update = Inventory.find(params[:inventory]).update(inventory_type_id: transfer_id)
         total = Inventory.find(params[:inventory])
         value = total.total_stock_qty
         final = value.to_i - params[:transfer_item].to_i
         total.update(total_stock_qty: final)
  end


  # redirect to transfer page
  def inventory_transfer2
    flash[:success] = "Successfully Transfered"
    redirect_to inventories_path
  end
end