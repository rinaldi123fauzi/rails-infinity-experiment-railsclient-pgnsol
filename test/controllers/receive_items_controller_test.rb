require 'test_helper'

class ReceiveItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receive_item = receive_items(:one)
  end

  test "should get index" do
    get receive_items_url
    assert_response :success
  end

  test "should get new" do
    get new_receive_item_url
    assert_response :success
  end

  test "should create receive_item" do
    assert_difference('ReceiveItem.count') do
      post receive_items_url, params: { receive_item: { item_id: @receive_item.item_id, receive_id: @receive_item.receive_id } }
    end

    assert_redirected_to receive_item_url(ReceiveItem.last)
  end

  test "should show receive_item" do
    get receive_item_url(@receive_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_receive_item_url(@receive_item)
    assert_response :success
  end

  test "should update receive_item" do
    patch receive_item_url(@receive_item), params: { receive_item: { item_id: @receive_item.item_id, receive_id: @receive_item.receive_id } }
    assert_redirected_to receive_item_url(@receive_item)
  end

  test "should destroy receive_item" do
    assert_difference('ReceiveItem.count', -1) do
      delete receive_item_url(@receive_item)
    end

    assert_redirected_to receive_items_url
  end
end
