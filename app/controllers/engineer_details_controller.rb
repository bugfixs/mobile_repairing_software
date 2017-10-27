class EngineerDetailsController < ApplicationController
   def show
    @engineer_detail = EngineerDetail.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@engineer_detail,:page_size => '841.89 x 1190.55')
        send_data pdf.render, filename: 'engineer_detail.pdf', type: 'application/pdf', disposition: "inline"
      end
    end
  end
end
