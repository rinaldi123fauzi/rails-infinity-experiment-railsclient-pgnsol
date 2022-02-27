require 'test_helper'

class ReceiveHistorysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receive_history = receive_histories(:one)
  end

  test "should get index" do
    get penerimaan_approvals_url
    assert_response :success
  end

  test "should get new" do
    get new_penerimaan_approval_url
    assert_response :success
  end

  test "should create receive_history" do
    assert_difference('ReceiveHistory.count') do
      post penerimaan_approvals_url, params: { receive_history: { catatan_penerimaan: @receive_history.catatan_penerimaan, receive_id: @receive_history.receive_id, role_id: @receive_history.role_id, status_id: @receive_history.status_id, user_id: @receive_history.user_id } }
    end

    assert_redirected_to penerimaan_approval_url(ReceiveHistory.last)
  end

  test "should show receive_history" do
    get penerimaan_approval_url(@receive_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_penerimaan_approval_url(@receive_history)
    assert_response :success
  end

  test "should update receive_history" do
    patch penerimaan_approval_url(@receive_history), params: { receive_history: { catatan_penerimaan: @receive_history.catatan_penerimaan, receive_id: @receive_history.receive_id, role_id: @receive_history.role_id, status_id: @receive_history.status_id, user_id: @receive_history.user_id } }
    assert_redirected_to penerimaan_approval_url(@receive_history)
  end

  test "should destroy receive_history" do
    assert_difference('ReceiveHistory.count', -1) do
      delete penerimaan_approval_url(@receive_history)
    end

    assert_redirected_to penerimaan_approvals_url
  end
end
