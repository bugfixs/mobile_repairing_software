class EngineerCopiesController < ApplicationController
  def show_engineer_copy
    @engineer_copy = EngineerCopy.find(params[:id])
   respond_to do |format|
    format.html
    format.pdf do
      pdf = Prawn::Document.new
      pdf.text 'Hello World'

      send_data pdf.render   

         
    end
  end
end
end
