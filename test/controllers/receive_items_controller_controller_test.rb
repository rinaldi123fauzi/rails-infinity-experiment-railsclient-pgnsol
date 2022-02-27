require 'test_helper'

class ReceiveItemsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get receive_items_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get receive_items_controller_create_url
    assert_response :success
  end

  test "should get index" do
    get receive_items_controller_index_url
    assert_response :success
  end

  test "should get update" do
    get receive_items_controller_update_url
    assert_response :success
  end

  test "should get delete" do
    get receive_items_controller_delete_url
    assert_response :success
  end

end
