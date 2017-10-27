class CustomerDetailPdf < Prawn::Document

	def initialize(customer_details,page_size)
		super()
		@customer_detail = customer_details
         text "Service Center: #{GeneralSetting.last.name}",:align => :right,size: 10,:style => :bold_italic
         text "Address: #{GeneralSetting.last.address}",:align => :right,size: 10,:style => :bold_italic
         text "Contact No: #{GeneralSetting.last.contact}",:align => :right,size: 10,:style => :bold_italic
         text "Email Address: #{GeneralSetting.last.email}",:align => :right,size: 10,:style => :bold_italic
        header
		text "<u><i><b>Acknowledgement of Service Request</b></i></u>", size: 14, :style => :bold_italic,:inline_format => true,
  	                                               :leading => 10,:height => 110,:align => :center,:text_color => "111111"
        text "Bill No: #{@customer_detail.bill_no} Call For Status: #{GeneralSetting.last.contact}",:style => :bold_italic,:inline_format => true,size: 10
       
        move_down(5)
        customer_detail_table_content
        text_content
    end

    def header
        text "Shree Communication", :style => :bold_italic
      # image "#{Rails.root}/app/assets/images/logo.jpeg", width: 102, height: 80
    end


	def customer_detail_table_content
      table customer_detail,
      :header => true,
      :cell_style => { size: 10 },
      :row_colors => ["FFFFFF", "FFFFFF"]
	   # table customer_detail do
	   # 	column(0).font_style = :bold
    #     column(2).font_style = :bold
    #     column(4).font_style = :bold
    #     self.header = true
        
    #    end
   end


	def customer_detail
	    data = [["Customer Name", @customer_detail.customer_name, "Request Date",@customer_detail.date, "Address", @customer_detail.address],
                 ["Customer No", @customer_detail.customer_no ,"Telephone No", @customer_detail.telephone_no,"Mobile No", @customer_detail.mobile_no],
                 ["Model Name", @customer_detail.mobile_modal_name, "Purchase Date", @customer_detail.purchase_date, "Serial No", @customer_detail.serial_no],
                 ["Full warranty", @customer_detail.full_warranty, "Labor only", @customer_detail.labor_only, "Parts only", @customer_detail.parts_only],
                 ["Out of warranty", @customer_detail.out_of_warranty, "Repair Received", @customer_detail.repair_received, "Repair Completed", @customer_detail.repair_completed],
                 ["Accessory", @customer_detail.accessory, "Engineer Name", @customer_detail.employee.first_name+"-"+@customer_detail.employee.last_name, "Repair Completed", @customer_detail.repair_completed],
                 ["Repair Description", @customer_detail.repair_description, "Condition Code", @customer_detail.condition_code, "Symptom Code", @customer_detail.symptom_code],
                 ["Defect Code", @customer_detail.defect_code, "Repair Code", @customer_detail.repair_code]]
    end

	
    def text_content
        y_position = cursor - 20

      bounding_box([0, y_position], :width => 470, :height => 300) do
        text "Term & Conditions", size: 11, style: :bold
        move_down(5)
        text "1. In warranty repair with the carried out subject to warranty validation by Service Center Staff, For warranty validation, customer is required to carry valid Warranty Card/Proof of purchase and it is to be produced at the time of submitting the Product when warranty service will not be provided.",size: 8, style: :bold
        move_down(5)
        text "2. The Customer Is requested to collect the Product within 3 days from the date of receiving confirmation completion of the repair from the service center. In case the customer does not complain the product within the said period of 3 days. Samsung or its authorized service center shall not be liable For any loss or damage to the Product, and/or any consequential losses or damages arising out of such loss and damage. Samsung shall have the right to scarp the said Product or dispose it of any manner without any notice  to the Customer and without incurring any liability, whatsoever, towards the Customer or anyone else.",size: 8, style: :bold
        move_down(5)
        text "3. For Out-warranty repairs, estimate pre-approval will not be taken from customer if estimated repair amount is less than Rs. 500/-. If estimated repair amount is more than Rs. 500/- then repair will be carried out after necessary approval/advance payment.",size: 8, style: :bold
        move_down(5)
        text "4. To enquiry the status of repair, customer should conatct at number(s) mentioned above with Claim No(Bill No, mentioned above) and date of submission of product or log onto Samsung.com/in.",size: 8, style: :bold
        move_down(5)
        text "5. The product has been accepted for service subject to interval verification. If Product is found to be tampered, misused, component removed, cracked or liquid logged, the same will not be considered under warranty. In such case customer will have to pay for the repair services or the the Product will be returned without repairs.",size: 8, style: :bold
        text "6. Customer should disable the STD/ISD service and remove SIM/Memory card before giving the set for service/repairs. Service Center will not be responsible of any claims from customers on bill from mobile service provider.",size: 8, style: :bold
        move_down(5)
        text "7. This receipts should be produced at the time of collecting the Product No delivers will be made if this receipt is lost. In the event of loss of receipt, customer should submit request along with an indemnity bond to the Service Center to obtain the set.",size: 8, style: :bold
        move_down(5)
        text "8. The customer should himself ensure proper backup of all the data stored on the handset. The customer agrees that Samsung or its associates shall not be held responsible or liable for any data loss on the Product in question.",size: 8, style: :bold
        move_down(5)
        text "9. The customer undertakes and agrees that the information provided by him is true and correct, Samsung can use the same for the purpose of follow up and taking feedback on the services by any means including voice, text etc.",size: 8, style: :bold
      end

    end

    # def table_content
    #   table product_rows do
    #     row(0).font_style = :bold
    #     self.header = true
    #     self.row_colors = ['DDDDDD', 'FFFFFF will not be ']
    #     self.column_widths = [40, 300, 200]
    #   end
    # end

    # def product_rows
    #   [['#', 'Name', 'Price']] +
    #   [[@customer_detail.id, @customer_detail.customer_name, @customer_detail.bill_no]]
    # end
end

# class CustomerDetailPdf < Prawn::Document
# 	def initialize(customer_details)
# 		super(top_margin: 70)
# 		@customer_details = customer_details
# 		table customer_detail
# 	end

# 	def customer_detail
# 		[["Customer Name", "Customer No", "Customer Address"]] +
# 		@customer_details.map do |c|
# 			[c.customer_name,c.customer_no,c.address]
# 		end
# 	end
# end
