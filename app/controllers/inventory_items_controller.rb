class InventoryItemsController < ApplicationController
  
  def create
    @customer_detail = CustomerDetail.find(params[:customer_detail_id])
    @item = @customer_detail.inventory_items.create(item)
    inventory_id = Inventory.find(params[:inventory_item][:inventory_id])
    stock_qty = inventory_id.total_stock_qty.to_i - 1
    inventory_id.update(:total_stock_qty => stock_qty)
    redirect_to inventory_item_path(@customer_detail)
  end

  def destroy
    @inv_item = InventoryItem.find(params[:id])
    inventory_item = @inv_item.inventory
    @customer_detail = @inv_item.customer_detail
    update_total_stock_qty = @inv_item.inventory.total_stock_qty.to_i + 1
    inventory_item.update(:total_stock_qty => update_total_stock_qty)
    @inv_item.destroy
    respond_to do |format|
      format.html { redirect_to inventory_item_path(@customer_detail), notice: 'Successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def show
    
   @customer_detail = CustomerDetail.shod(params[:id])
    @item = @customer_detail.inventory_items
    # @inv_item = InventoryItem.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@customer_detail,:page_size => '841.89 x 1190.55')
        send_data pdf.render, filename: 'invoice_pdf.pdf', type: 'application/pdf', disposition: "inline"
      end
    end
  end

  def show_invoice
    @customer_detail = CustomerDetail.shod(params[:id])
    @item = @customer_detail.inventory_items
    respond_to do |format|
     format.html
     format.pdf do
      render pdf: "show_invoice",
     
      template: "inventory_items/show_invoice.html.erb",
      layout: false
     end
    end
  end

  def select_inventory
    @inventory_type = InventoryType.shod(params[:inventory_type_id])
    @inventory = @inventory_type.inventories
  end

  def add_product_existing_customer
    @customer_detail = CustomerDetail.shod(params[:id])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def item
       params.require(:inventory_item).permit(:name,:inventory_id,:customer_detail_id,:inventory_type_id)
    end
end

