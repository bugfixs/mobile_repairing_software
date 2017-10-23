class InventoryTransfersController < ApplicationController
	# get all courses from database
  # create new object of inventory,
  # and perform authorization
  def index
    @inventories ||= Inventory.all
    @inventory = Inventory.new
    @inventory_type = InventoryType.shod(params[:id])
    respond_to do |format|
    format.html
    format.js { render layout: false }
  end
  end

  # find inventory_type which we selected,
  # and perform authorization
  def select
    @inventory_type = InventoryType.shod(params[:inventory_transfer][:id])
  end

  # findinventory_type which we selected, get all students in that batch
  # and perform authorization
  def transfer
    @inventory_type = InventoryType.shod(params[:id])
    @inventories ||= Inventory.all
    @inventory_transfers ||= @inventory_type.inventories
  end

  # get all products of that inventory
  # this method is use for select all inventory_type in one click
  # and perform authorization
  def assign_all
    @inventory_type =  InventoryType.shod(params[:format])
    @inventory_transfers ||= @inventory_type.inventories
  end

  # get all products of that inventory
  # this method is use for deselect all student in one click
  # and perform authorization
  def remove_all
    @inventory_type =  InventoryType.shod(params[:format])
    @inventory_transfers ||= @inventory_type.inventories
  end

  # this method is used to transfer inventory
  # from one inventory to another inventory
  # and perform authorization
  def inventory_transfer
    @inventory = Inventory.shod(params[:inventory_transfer][:inventory_type_id])
    @inventory.trans(params[:inventory], params[:inventory_transfer][:id], @inventory)
    inventory_transfer2
  end

  # redirect to transfer page
  def inventory_transfer2
    flash[:notice] = t('inventory_transfer')
    redirect_to transfer_inventory_transfer_path(@inventory)
  end
end