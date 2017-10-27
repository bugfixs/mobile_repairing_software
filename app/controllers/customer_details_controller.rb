class CustomerDetailsController < ApplicationController
  before_action :set_customer_detail, only: [:show, :edit, :update, :destroy]

  # GET /customer_details
  # GET /customer_details.json
  def index
    @customer_details = CustomerDetail.all
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = ReportPdf.new(@customer_details)
    #     send_data pdf.render, filename: 'customer_details.pdf', type: 'application/pdf', disposition: "inline"
    #   end
    # end
  end

  # GET /customer_details/1
  # GET /customer_details/1.json
  def show
    @general_setting = GeneralSetting.last
    @customer_detail = CustomerDetail.find(params[:id])
     @engineer_detail = EngineerDetail.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CustomerDetailPdf.new(@customer_detail,:page_size => '841.89 x 1190.55')
        send_data pdf.render, filename: 'customer_detail.pdf', type: 'application/pdf', disposition: "inline"
      end
    end
  end

  # def show_engineer_copy
  #   binding.pry
  #   @engineer_detail = EngineerDetail.find(params[:id])
  #   respond_to do |format|
  #     format.html
  #     format.pdf do
  #       pdf = EngineerDetailPdf.new(@engineer_detail,:page_size => '841.89 x 1190.55')
  #       send_data pdf.render, filename: 'show_engineer_copy_engineer_detail.pdf', type: 'application/pdf', disposition: "inline"
  #     end
  #   end
  # end


  # GET /customer_details/new
  def new
    @customer_detail = CustomerDetail.new
  end

  # GET /customer_details/1/edit
  def edit
  end

  # POST /customer_details
  # POST /customer_details.json
  def create
    @customer_detail = CustomerDetail.new(customer_detail_params)

    respond_to do |format|
      if @customer_detail.save
        format.html { redirect_to customer_details_path, notice: 'Customer detail was successfully created.' }
        format.json { render :new, status: :created }
      else
        format.html { render :new }
        format.json { render json: @customer_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_details/1
  # PATCH/PUT /customer_details/1.json
  def update
    respond_to do |format|
      if @customer_detail.update(customer_detail_params)
        format.html { redirect_to @customer_detail, notice: 'Customer detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_detail }
      else
        format.html { render :edit }
        format.json { render json: @customer_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_details/1
  # DELETE /customer_details/1.json
  def destroy
    @customer_detail.destroy
    respond_to do |format|
      format.html { redirect_to customer_details_url, notice: 'Customer detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_detail
      @customer_detail = CustomerDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_detail_params
      params.require(:customer_detail).permit(:employee_id,:bill_no, :mobile_modal_name,:customer_name, :date, :address, :customer_no, :telephone_no, :mobile_no, :model_name, :purchase_date, :serial_no, :full_warranty, :labor_only, :parts_only, :out_of_warranty, :repair_received, :repair_completed, :good_delivered, :return_by_date, :defect_description, :b2b_svc, :accessory, :remark, :repair_description, :condition_code, :symptom_code, :defect_code, :repair_code)
    end
end
