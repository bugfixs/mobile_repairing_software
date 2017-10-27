class EngineerPdf < Prawn::Document

	def initialize(engineer_copys,page_size)
		super()
		@engineer_copy = engineer_copys
         text "#{GeneralSetting.last.name}",:align => :right
         text "#{GeneralSetting.last.address}",:align => :right
         text "#{GeneralSetting.last.contact}",:align => :right
         text "#{GeneralSetting.last.email}",:align => :right
        header
		text "<u><i><b>Acknowledgement of Service Request</b></i></u>", size: 14, :style => :bold_italic,:inline_format => true,
  	                                               :leading => 10,:height => 110,:align => :center,:text_color => "111111"
		text "Bill No: #{@engineer_copy.customer_detail.bill_no} Call For Status: #{GeneralSetting.last.contact}",:style => :bold_italic,:inline_format => true,size: 10
       
        move_down(5)
        customer_detail_table_content
        engineer_table_content
        text_content
    end

    def header
        text "Shree Communication", :style => :bold_italic
      # image "#{Rails.root}/app/assets/images/logo.jpeg", width: 102, height: 80
    end


	def customer_detail_table_content
	   table customer_detail do
	   	column(0).font_style = :bold
        column(2).font_style = :bold
        column(4).font_style = :bold
        self.header = true
       end
   end


	def customer_detail
	    data = [["Customer Name", @engineer_copy.customer_detail.customer_name, "Request Date",@engineer_copy.customer_detail.date, "Address", @engineer_copy.customer_detail.address],
                 ["Customer No", @engineer_copy.customer_detail.customer_no ,"Telephone No", @engineer_copy.customer_detail.telephone_no,"Mobile No", @engineer_copy.customer_detail.mobile_no],
                 ["Model Name", @engineer_copy.customer_detail.mobile_modal_name, "Purchase Date", @engineer_copy.customer_detail.purchase_date, "Serial No", @engineer_copy.customer_detail.serial_no],
                 ["Full warranty", @engineer_copy.customer_detail.full_warranty, "Labor only", @engineer_copy.customer_detail.labor_only, "Parts only", @engineer_copy.customer_detail.parts_only],
                 ["Out of warranty", @engineer_copy.customer_detail.out_of_warranty, "Repair Received", @engineer_copy.customer_detail.repair_received, "Repair Completed", @engineer_copy.customer_detail.repair_completed],
                 ["Accessory", @engineer_copy.customer_detail.accessory, "Remark", @engineer_copy.employee.first_name+ " - "+@engineer_copy.employee.last_name, "Repair Completed", @engineer_copy.customer_detail.repair_completed],
                 ["Repair Description", @engineer_copy.customer_detail.repair_description, "Condition Code", @engineer_copy.customer_detail.condition_code, "Symptom Code", @engineer_copy.customer_detail.symptom_code],
                 ["Defect Code", @engineer_copy.customer_detail.defect_code, "Repair Code", @engineer_copy.customer_detail.repair_code]]
    end

    def engineer_table_content
      table engineer_detail do
        column(0).font_style = :bold
        column(2).font_style = :bold
        column(4).font_style = :bold
        self.header = true
       end
    end

    def engineer_detail
   table items, :border_style => :grid,
  :row_colors => ["FFFFFF", "DDDDDD"],
  :headers => ["Product", "Qty", "Unit Price", "Full Price"],
  :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }
    end





end
