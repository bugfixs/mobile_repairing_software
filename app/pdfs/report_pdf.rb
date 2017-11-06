class ReportPdf < Prawn::Document
  def initialize(engineer_copys,page_size)
    super()
    @engineer_detail = engineer_copys
         text "Service Center: #{GeneralSetting.last.name}",:align => :right,size: 10,:style => :bold_italic
         text "Address: #{GeneralSetting.last.address}",:align => :right,size: 10,:style => :bold_italic
         text "Contact No: #{GeneralSetting.last.contact}",:align => :right,size: 10,:style => :bold_italic
         text "Email Address: #{GeneralSetting.last.email}",:align => :right,size: 10,:style => :bold_italic
        header
    text "<u><i><b>Acknowledgement of Service Request</b></i></u>", size: 14, :style => :bold_italic,:inline_format => true,
                                                   :leading => 10,:height => 110,:align => :center,:text_color => "111111"
    text "Bill No: #{@engineer_detail.bill_no} Call For Status: #{GeneralSetting.last.contact}",:style => :bold_italic,:inline_format => true,size: 10
       
        move_down(5)
        customer_detail_table_content
        move_down(10)
        invoice
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
     # column(0).font_style = :bold,
     # column(2).font_style = :bold
     # column(4).font_style = :bold

     # self.header = true
    
  end


  def customer_detail
      data = [["Customer Name", @engineer_detail.customer_name, "Request Date",@engineer_detail.date, "Address", @engineer_detail.address],
                 ["Customer No", @engineer_detail.customer_no ,"Telephone No", @engineer_detail.telephone_no,"Mobile No", @engineer_detail.mobile_no],
                 ["Model Name", @engineer_detail.mobile_modal_name, "Purchase Date", @engineer_detail.purchase_date, "Serial No", @engineer_detail.serial_no],
                 ["Full warranty", @engineer_detail.full_warranty, "Labor only", @engineer_detail.labor_only, "Parts only", @engineer_detail.parts_only],
                 ["Out of warranty", @engineer_detail.out_of_warranty, "Repair Received", @engineer_detail.repair_received, "Repair Completed", @engineer_detail.repair_completed],
                 ["Accessory", @engineer_detail.accessory, "Remark", @engineer_detail.employee.first_name+ " - "+@engineer_detail.employee.last_name, "Repair Completed", @engineer_detail.repair_completed],
                 ["Repair Description", @engineer_detail.repair_description, "Condition Code", @engineer_detail.condition_code, "Symptom Code", @engineer_detail.symptom_code],
                 ["Defect Code", @engineer_detail.defect_code, "Repair Code", @engineer_detail.repair_code]]
  end

    def invoice
      table engineer_detail,
      :header => true,
      :cell_style => { size: 10 },
      :row_colors => ["FFFFFF", "FFFFFF"]
    end

  def engineer_detail
      data =([["Sr.No", "Parts No", "Description", "Location", "Quantity", "Unit Price(INR)", "Amount(INR)", "Part Return Date"],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "]])
  end

  def text_content
        y_position = cursor - 20

      bounding_box([0, y_position], :width => 400, :height => 150) do
        text "Declaration:", size: 10
        move_down(1)
        text "1. I confirm that I have receive my product in good working condition and to my full satisfaction.",size: 8, style: :bold
        move_down(1)
        text "2. I have read and understood the communication brought to my knowledge with regards to hazardous nature of the electrical and electronic equiments and its spare parts and the need foe safe handling and disposal of e-waste to protect and safeguard the environment.", size: 8, style: :bold
        move_down(1)
        text "3. I hereby Acknowledgement that the replaced defective part may be an e-waste.Therefore I am leaving the same at Service Center for safe disposal.",size: 8, style: :bold
        move_down(1)
        text "4. OR",size: 8, style: :bold
        move_down(1)
        text "5.I hereby Acknowledgement that I have chosen to receive and collect defective part of my product the same may by an enviornment hazardous E-waste. I futher acknowledgement that I shall handle it responsibly in an environmentally friendly.",size: 8, style: :bold
        move_down(1)
        text " Signature of Customer & Collection",size: 8, style: :bold
      end

      bounding_box([300, y_position], :width => 300, :height => 150) do
        move_down(120)
        text "Received By: ",size: 8, style: :bold
        move_down(2)
        text "For Samsung Customer Service.",size: 8, style: :bold 
        move_down(1)
        text "Delivered By: ",size: 8, style: :bold 
      end
    end





 #  def engineer_detail
 #      data =([ ["Sr.No", "Parts No", "Description", "Location", "Quantity", "Unit Price(INR)", "Amount(INR)", "Part Return Date"],
 # ["short", "loooooooooooooooooooong", "short"],
 # ["loooooooooooooooooooong", "short", "short"] ]) 

 #    end

   # def engineer_table_content
  #     table engineer_detail,
  #     :header => true,
  #     :cell_style => { size: 15 },
  #     :row_colors => ["FFFFFF", "FFFFFF"]
  #     # table engineer_detail do
  #     #   column(0).font_style = :bold
  #     #   column(1).font_style = :bold
  #     #   column(2).font_style = :bold
  #     #   column(3).font_style = :bold
  #     #   column(4).font_style = :bold
  #     #   column(5).font_style = :bold
  #     #   column(6).font_style = :bold
  #     #   column(7).font_style = :bold
  #     #   column(8).font_style = :bold
  #     #   self.header = true
  #     #  end
  #   end

   

end