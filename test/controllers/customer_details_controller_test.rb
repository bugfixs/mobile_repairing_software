require 'test_helper'

class CustomerDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_detail = customer_details(:one)
  end

  test "should get index" do
    get customer_details_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_detail_url
    assert_response :success
  end

  test "should create customer_detail" do
    assert_difference('CustomerDetail.count') do
      post customer_details_url, params: { customer_detail: { accessory: @customer_detail.accessory, address: @customer_detail.address, b2b_svc: @customer_detail.b2b_svc, condition_code: @customer_detail.condition_code, customer_name: @customer_detail.customer_name, customer_no: @customer_detail.customer_no, date: @customer_detail.date, defect_code: @customer_detail.defect_code, defect_description: @customer_detail.defect_description, full_warranty: @customer_detail.full_warranty, good_delivered: @customer_detail.good_delivered, labor_only: @customer_detail.labor_only, mobile_no: @customer_detail.mobile_no, model_name: @customer_detail.model_name, out_of_warranty: @customer_detail.out_of_warranty, parts_only: @customer_detail.parts_only, purchase_date: @customer_detail.purchase_date, remark: @customer_detail.remark, repair_code: @customer_detail.repair_code, repair_completed: @customer_detail.repair_completed, repair_description: @customer_detail.repair_description, repair_received: @customer_detail.repair_received, return_by_date: @customer_detail.return_by_date, serial_no: @customer_detail.serial_no, symptom_code: @customer_detail.symptom_code, telephone_no: @customer_detail.telephone_no } }
    end

    assert_redirected_to customer_detail_url(CustomerDetail.last)
  end

  test "should show customer_detail" do
    get customer_detail_url(@customer_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_detail_url(@customer_detail)
    assert_response :success
  end

  test "should update customer_detail" do
    patch customer_detail_url(@customer_detail), params: { customer_detail: { accessory: @customer_detail.accessory, address: @customer_detail.address, b2b_svc: @customer_detail.b2b_svc, condition_code: @customer_detail.condition_code, customer_name: @customer_detail.customer_name, customer_no: @customer_detail.customer_no, date: @customer_detail.date, defect_code: @customer_detail.defect_code, defect_description: @customer_detail.defect_description, full_warranty: @customer_detail.full_warranty, good_delivered: @customer_detail.good_delivered, labor_only: @customer_detail.labor_only, mobile_no: @customer_detail.mobile_no, model_name: @customer_detail.model_name, out_of_warranty: @customer_detail.out_of_warranty, parts_only: @customer_detail.parts_only, purchase_date: @customer_detail.purchase_date, remark: @customer_detail.remark, repair_code: @customer_detail.repair_code, repair_completed: @customer_detail.repair_completed, repair_description: @customer_detail.repair_description, repair_received: @customer_detail.repair_received, return_by_date: @customer_detail.return_by_date, serial_no: @customer_detail.serial_no, symptom_code: @customer_detail.symptom_code, telephone_no: @customer_detail.telephone_no } }
    assert_redirected_to customer_detail_url(@customer_detail)
  end

  test "should destroy customer_detail" do
    assert_difference('CustomerDetail.count', -1) do
      delete customer_detail_url(@customer_detail)
    end

    assert_redirected_to customer_details_url
  end
end
