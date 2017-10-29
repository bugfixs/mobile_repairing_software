class ReportsController < ApplicationController
    def select
      @inventory_type = InventoryType.shod(params[:inventory_type_id])
      @inventory_types = InventoryType.all
      @inventories = @inventory_type.inventories
    end


    def report
    	@inventories ||= Inventory.all
    	@inventory = Inventory.new
    	@inventory_types = InventoryType.all
    	@inventory_logs = InventoryLog.all
    	@inventory_transfers = Transfer.all
    	@inventory_type = InventoryType.find_by_id(params[:id])
    end

    def transfer
        @inventory_transfers = Transfer.all
       @inventories ||= Inventory.all
    end
end