class InvoicePdf < Prawn::Document

  def initialize(inventory_items,page_size)
    super()
    @customer_detail = inventory_items
     text "Service Center: #{GeneralSetting.last.name}",:align => :right,size: 10,:style => :bold_italic
         text "Address: #{GeneralSetting.last.address}",:align => :right,size: 10,:style => :bold_italic
         text "Contact No: #{GeneralSetting.last.contact}",:align => :right,size: 10,:style => :bold_italic
         text "Email Address: #{GeneralSetting.last.email}",:align => :right,size: 10,:style => :bold_italic
         
         header
       
        text "<u><i><b>Acknowledgement of Service Request</b></i></u>", size: 14, :style => :bold_italic,:inline_format => true,
                                                   :leading => 10,:height => 110,:align => :center,:text_color => "111111"
        move_down(2)
        text "Bill No: #{@customer_detail.bill_no}",:align => :right,size: 10
        move_down(2)
        text "Customer Name: #{@customer_detail.customer_name}",:align => :right,size: 10
        move_down(2)
        text "Request Date: #{@customer_detail.date}",:align => :right,size: 10
        move_down(30)
        invoice
        move_down(30)
        # testing
        repairing
        software
        # estimated_cost
        move_down(5)
    #     text "Estimated Cost: #{@total_estimate_cost = GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(s.inventory.map.to_f))/100) + s.inventory.map.to_f + @repair_gst.to_f + @testing_gst.to_f + @software.to_f} ",:style => :bold_italic,:inline_format => true,size: 10
     end

    def header
        text "Shree Communication", :style => :bold_italic,size: 15
        text "Authorized Service Center"

      # image "#{Rails.root}/app/assets/images/logo.jpeg", width: 102, height: 80
    end

  def invoice
      table engineer_detail do
        row(0).font_style  = :bold
        columns(0..7).size = 8
        self.header = true

    end
  end

  def engineer_detail
   
      data =[["Part No", "Description", "Branch No", "Taxable Value(A)", "SGST (9%)", "CGST (9%)", "Total Tax Amount (18%)", "Grand Total"]] +

        @customer_detail.inventory_items.map do |i|
            [ @Grand_total =i.inventory.part_no ,i.inventory.description, i.inventory.branch, i.inventory.map,
            ((GeneralSetting.last.sgst.to_f)*(i.inventory.map.to_f)/100),
            ((GeneralSetting.last.cgst.to_f)*(i.inventory.map.to_f)/100),
            ((GeneralSetting.last.sgst.to_f)*(i.inventory.map.to_f)/100) + ((GeneralSetting.last.cgst.to_f)*(i.inventory.map.to_f)/100) ,
            (((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(i.inventory.map.to_f))/100) + i.inventory.map.to_f]
        end
  end


                                  



#   def testing
#     table tests do
#       row(0).font_style  = :bold
#       columns(0..7).size = 8
#       rows(0..7).size = 8
#       self.header = true
#   end
# end

#   def tests
#      data =[[ "Taxable Value(A)", "SGST (9%)", "CGST (9%)", "Total Tax Amount (18%)", "Grand Total"]] +
     
#         data = [[GeneralSetting.last.testing_cost.to_f , ((GeneralSetting.last.sgst.to_f)*(GeneralSetting.last.testing_cost.to_f)/100), ((GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.testing_cost.to_f)/100),(((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.testing_cost.to_f))/100) + GeneralSetting.last.testing_cost.to_f, (((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.testing_cost.to_f))/100) + GeneralSetting.last.testing_cost.to_f]]
#         #[[GeneralSetting.last.repair_cost.to_f , ((GeneralSetting.last.sgst.to_f)*(GeneralSetting.last.repair_cost.to_f)/100), ((GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.repair_cost.to_f)/100),(((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.repair_cost.to_f))/100) + GeneralSetting.last.repair_cost.to_f, (((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.repair_cost.to_f))/100) + GeneralSetting.last.repair_cost.to_f]]
#        # [[GeneralSetting.last.software_testing_cost.to_f , ((GeneralSetting.last.sgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f)/100), ((GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f)/100),(((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f))/100) + GeneralSetting.last.software_testing_cost.to_f, (((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f))/100) + GeneralSetting.last.software_testing_cost.to_f]]
  
#   end

def testing
    table test_detail do
      row(0).font_style  = :bold
      columns(0..7).size = 8
      rows(0..7).size = 8
      self.header = true
    end 
  end

  def test_detail
    data =[[ "Name","Taxable Value(A)", "SGST (9%)", "CGST (9%)", "Total Tax Amount (18%)", "Grand Total"]] +
    if @customer_detail.testing_cost == 'Yes'
      data = [["Testing Cost",GeneralSetting.last.testing_cost ,@testing_gst = GeneralSetting.last.sgst.to_f , GeneralSetting.last.cgst.to_f, GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f,(((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.testing_cost.to_f))/100) + GeneralSetting.last.testing_cost.to_f]]
    end
  end

  def repairing
    table repair do
      row(0).font_style  = :bold
      columns(0..7).size = 8
      rows(0..7).size = 8
      self.header = true
    end 
  end

  def repair
    data =[[ "Name","Taxable Value(A)", "SGST (9%)", "CGST (9%)", "Total Tax Amount (18%)", "Grand Total"]] +
    if @customer_detail.repair_cost == 'Yes'
      data = [["Repairing Cost",GeneralSetting.last.repair_cost,@repair_gst = ((GeneralSetting.last.sgst.to_f)*(GeneralSetting.last.repair_cost.to_f)/100) , ((GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.repair_cost.to_f)/100), ((GeneralSetting.last.sgst.to_f)*(GeneralSetting.last.repair_cost.to_f)/100) + ((GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.repair_cost.to_f)/100),(((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.repair_cost.to_f))/100) + GeneralSetting.last.repair_cost.to_f]]
    end
  end


  def software
    table soft do
      row(0).font_style  = :bold
      columns(0..7).size = 8
      rows(0..7).size = 8
      self.header = true
    end
  end

  def soft
     data =[["Name", "Taxable Value(A)", "SGST (9%)", "CGST (9%)", "Total Tax Amount (18%)", "Grand Total"]] +
    if @customer_detail.software_testing_cost == 'Yes'
      data = [["Software Cost ",GeneralSetting.last.software_testing_cost,@software = ((GeneralSetting.last.sgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f)/100) , ((GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f)/100), ((GeneralSetting.last.sgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f)/100) + ((GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f)/100),(((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(GeneralSetting.last.software_testing_cost.to_f))/100) + GeneralSetting.last.software_testing_cost.to_f]]
    end
  end

  #   def estimated_cost
  #     table estimate, :position => :right do
  #     row(0).font_style  = :bold
  #     columns(0..7).size = 8
  #     height = 50  
  #     row(0).align = :right
  #     position = :right
  #     self.header = true

  #   end
  # end

  # # def estimate
  # #     move_down(15)
  # #      data =[["Estimated Cost"]] +
  # #      @customer_detail.inventory_items.map do |s|
  # #      #[total_estimate_cost = (((GeneralSetting.last.sgst.to_f + GeneralSetting.last.cgst.to_f)*(s.inventory.map.to_f))/100) + s.inventory.map.to_f + ]
  # #      end
  # # end




  



  #   def invoice
  #     table engineer_detail,
  #     :header => true,
  #     :cell_style => { size: 10 },
  #     :row_colors => ["FFFFFF", "FFFFFF"]
  #   end

  # def engineer_detail
  #   [["Sr.No", "Parts No", "Description", "Branch No", "Actual Price"]] +
  #   @inv_item.customer_detail.inventory_items.all.each_with_index do |s,i|
  #     ["#{s.inventory.part_no}"]

  #   end
  # end


  #   def engineer_table_content
  #     table engineer_detail do
  #       column(0).font_style = :bold
  #       column(2).font_style = :bold
  #       column(4).font_style = :bold
  #       self.header = true
  #      end
  #   end

  #   def engineer_detail
  #  table items, :border_style => :grid,
  # :row_colors => ["FFFFFF", "DDDDDD"],
  # :headers => ["Product", "Qty", "Unit Price", "Full Price"],
  # :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }
  #   end





end




