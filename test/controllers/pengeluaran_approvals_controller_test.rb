require 'test_helper'

class PengeluaranApprovalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pengeluaran_approval = pengeluaran_approvals(:one)
  end

  test "should get index" do
    get pengeluaran_approvals_url
    assert_response :success
  end

  test "should get new" do
    get new_pengeluaran_approval_url
    assert_response :success
  end

  test "should create pengeluaran_approval" do
    assert_difference('PengeluaranApproval.count') do
      post pengeluaran_approvals_url, params: { pengeluaran_approval: { role_id: @pengeluaran_approval.role_id, sale_id: @pengeluaran_approval.sale_id, status_id: @pengeluaran_approval.status_id, user_id: @pengeluaran_approval.user_id } }
    end

    assert_redirected_to pengeluaran_approval_url(PengeluaranApproval.last)
  end

  test "should show pengeluaran_approval" do
    get pengeluaran_approval_url(@pengeluaran_approval)
    assert_response :success
  end

  test "should get edit" do
    get edit_pengeluaran_approval_url(@pengeluaran_approval)
    assert_response :success
  end

  test "should update pengeluaran_approval" do
    patch pengeluaran_approval_url(@pengeluaran_approval), params: { pengeluaran_approval: { role_id: @pengeluaran_approval.role_id, sale_id: @pengeluaran_approval.sale_id, status_id: @pengeluaran_approval.status_id, user_id: @pengeluaran_approval.user_id } }
    assert_redirected_to pengeluaran_approval_url(@pengeluaran_approval)
  end

  test "should destroy pengeluaran_approval" do
    assert_difference('PengeluaranApproval.count', -1) do
      delete pengeluaran_approval_url(@pengeluaran_approval)
    end

    assert_redirected_to pengeluaran_approvals_url
  end
end
