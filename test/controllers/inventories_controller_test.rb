require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post inventories_url, params: { inventory: { branch: @inventory.branch, description: @inventory.description, engineer_stock_qty: @inventory.engineer_stock_qty, inventory_type_id: @inventory.inventory_type_id, latest_modify_date: @inventory.latest_modify_date, location1: @inventory.location1, location2: @inventory.location2, location3: @inventory.location3, map: @inventory.map, part_no: @inventory.part_no, remark: @inventory.remark, status: @inventory.status, total_stock_qty: @inventory.total_stock_qty, total_stock_value: @inventory.total_stock_value, warehouse_stock_qty: @inventory.warehouse_stock_qty } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { branch: @inventory.branch, description: @inventory.description, engineer_stock_qty: @inventory.engineer_stock_qty, inventory_type_id: @inventory.inventory_type_id, latest_modify_date: @inventory.latest_modify_date, location1: @inventory.location1, location2: @inventory.location2, location3: @inventory.location3, map: @inventory.map, part_no: @inventory.part_no, remark: @inventory.remark, status: @inventory.status, total_stock_qty: @inventory.total_stock_qty, total_stock_value: @inventory.total_stock_value, warehouse_stock_qty: @inventory.warehouse_stock_qty } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end
end
