require 'test_helper'

class SaleApprovalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_history = sale_histories(:one)
  end

  test "should get index" do
    get sale_approvals_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_approval_url
    assert_response :success
  end

  test "should create sale_history" do
    assert_difference('SaleHistory.count') do
      post sale_approvals_url, params: { sale_history: { catatan_penjualan: @sale_history.catatan_penjualan, sale_id: @sale_history.sale_id, status_id: @sale_history.status_id, user_id: @sale_history.user_id } }
    end

    assert_redirected_to sale_approval_url(SaleHistory.last)
  end

  test "should show sale_history" do
    get sale_approval_url(@sale_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_approval_url(@sale_history)
    assert_response :success
  end

  test "should update sale_history" do
    patch sale_approval_url(@sale_history), params: { sale_history: { catatan_penjualan: @sale_history.catatan_penjualan, sale_id: @sale_history.sale_id, status_id: @sale_history.status_id, user_id: @sale_history.user_id } }
    assert_redirected_to sale_approval_url(@sale_history)
  end

  test "should destroy sale_history" do
    assert_difference('SaleHistory.count', -1) do
      delete sale_approval_url(@sale_history)
    end

    assert_redirected_to sale_approvals_url
  end
end
